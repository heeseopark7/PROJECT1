
########################################
# InitDesign (Setup, Floorplan)
########################################

## Initialization
set init_gnd_net VSS
set init_lef_file {../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/lef/gsclib045_tech.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef ../../../../SoC/GPDK045/digital/giolib045_v3.5/lef/giolib045_modify.lef}
set init_verilog ../SYN/mapped/uart_top_syn_final.v
set init_mmmc_file uart_top.mmmc.view
set init_io_file init.io
set init_top_cell uart_top
set init_pwr_net VDD
init_design

## Check Design
checkDesign -io -netlist -physicalLibrary -powerGround -tieHilo -timingLibrary -spef -floorplan -place -outdir checkDesign

##################################################
## Floorplan :: Below is for CHIP AREA (1000,1000)
## core 99.18 x 99.18, margins are measured from the DIE edge
##################################################
floorPlan -site CoreSite -s 99.18 99.18 450.41 450.41 450.41 450.41 -coreMarginsBy die

## Re-place all IO pads (signal + power + corners) for the new die
loadIoFile init.io

## Check the floorplan, it should be about {0 0 1000 1000}
puts [dbGet top.fPlan.box]
puts [dbGet top.fPlan.coreBox]

## IO Filler Insertion
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side n
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side s
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side w
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side e

# Verify Timing
report_analysis_views 
timeDesign -prePlace

## If there is no error, Save Design
saveDesign -def InitDesign
exit
