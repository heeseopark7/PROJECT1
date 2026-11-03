########################################
# InitDesign (Setup, Floorplan)  :: uart_top  (NO IO PAD)
########################################
## Synthesis netlist (SYN/mapped/uart_top_syn_final.v) has no pad cells.
## Ports are bare : i_clk i_nRst i_rx (in) / o_tx o_led_ctrl (out)
## -> no init.io, no PAD placement, no IO filler.
## -> die is sized from the core + a margin that holds the power ring/stripes.

## Initialization
##   init_io_file is NOT set (no pads).
set init_gnd_net VSS
set init_pwr_net VDD
set init_lef_file {../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/lef/gsclib045_tech.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef}
set init_verilog ../SYN/mapped/uart_top_syn_final.v
set init_mmmc_file uart_top.mmmc.view
set init_top_cell uart_top
init_design

## Check Design  (-io : bare ports only, no pad)
checkDesign -io -netlist -physicalLibrary -powerGround -tieHilo -timingLibrary -spef -floorplan -place -outdir checkDesign

##################################################
## Floorplan
##   -r : aspect ratio 1.0 (square), core utilization 0.7
##   margin 20um on every side (core -> die edge)
##     inner ring (width 5 + spacing 5 + offset 5 = ~25) is placed OUTSIDE the core,
##     so the margin must be larger than the ring.  -> see MARGIN below.
##################################################
set UTIL    0.7
set MARGIN  30.0

floorPlan -site CoreSite -r 1.0 $UTIL $MARGIN $MARGIN $MARGIN $MARGIN

## Sanity check
puts "FPLAN BOX  : [dbGet top.fPlan.box]"
puts "FPLAN CORE : [dbGet top.fPlan.coreBox]"

##################################################
## IO Pin placement (no pad -> pins are placed directly on the die edge)
##   Left   : i_clk, i_nRst, i_rx
##   Right  : o_tx, o_led_ctrl
##   Metal3 = horizontal layer in GPDK045 (Metal1 H / Metal2 V / Metal3 H ...)
##################################################
setPinAssignMode -pinEditInBatch true
editPin -pin {i_clk i_nRst i_rx}  -side Left  -layer 3 -spreadType center -spacing 4.0 -fixOverlap 1 -fixedPin 1 -snap TRACK
editPin -pin {o_tx o_led_ctrl}    -side Right -layer 3 -spreadType center -spacing 4.0 -fixOverlap 1 -fixedPin 1 -snap TRACK
setPinAssignMode -pinEditInBatch false

# Verify Timing
report_analysis_views
timeDesign -prePlace

## If there is no error, Save Design
saveDesign -def InitDesign
exit
