########################################
# InitDesign (Setup, Floorplan)  :: uart_top
########################################

## Initialization
##   init_io_file is NOT set here.
##   If init.io is read in init_design, pads are fixed on an auto-sized die (888)
##   and floorPlan cannot shrink it (IMPFP-316). Pads are loaded after floorPlan.
set init_gnd_net VSS
set init_lef_file {../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/lef/gsclib045_tech.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef ../../../../SoC/GPDK045/digital/giolib045_v3.5/lef/giolib045_modify.lef}
set init_verilog ../SYN/mapped/uart_top_syn_final.v
set init_mmmc_file uart_top.mmmc.view
set init_top_cell uart_top
set init_pwr_net VDD
init_design

## Check Design
checkDesign -io -netlist -physicalLibrary -powerGround -tieHilo -timingLibrary -spef -floorplan -place -outdir checkDesign

##################################################
## Floorplan :: CHIP AREA (840, 840)
##   die    = 240(corner) + 6 slots x 60 + 240(corner) = 840
##   core   = square, sized from real std cell area for util 0.7
##   margin = (840 - core) / 2   (core to die edge)
##################################################
set DIE      840.0
set UTIL     0.7
set ROW_H    1.71

## 1. Std cell area measured by Innovus (IO pads excluded)
set cell_area 0.0
foreach i [dbGet top.insts.cell.baseClass core -p2] {
    set cell_area [expr {$cell_area + [dbGet $i.cell.size_x] * [dbGet $i.cell.size_y]}]
}
if {$cell_area <= 0.0} {
    puts "ERROR : std cell area = 0 -> check 'dbGet top.insts.cell.baseClass -u'"
    return
}

## 2. Core side = sqrt(area / util), rounded up to a multiple of row height
set CORE   [expr {ceil(sqrt($cell_area / $UTIL) / $ROW_H) * $ROW_H}]
set MARGIN [expr {($DIE - $CORE) / 2.0}]
puts "STDCELL AREA : $cell_area"
puts "CORE SIDE    : $CORE  (util target $UTIL)"
puts "CORE MARGIN  : $MARGIN"
if {$CORE > 130.0} {
    puts "WARNING : core > 130um. Outer power ring (offset 100) may hit the pads -> reduce ring offset in 1_PowerPlan.tcl"
}

## 3. Die size fixed to 840 (-d : die W/H + core-to-die margins)
floorPlan -site CoreSite -d $DIE $DIE $MARGIN $MARGIN $MARGIN $MARGIN

## Sanity check :: die box must be {0 0 840 840}
puts "FPLAN BOX  : [dbGet top.fPlan.box]"
puts "FPLAN CORE : [dbGet top.fPlan.coreBox]"

## Load IO pads + corners on the 840 die
loadIoFile init.io

## Place IO cells (lower-left coordinate of each pad, same as init.io)
##   South y=0 R0 | West x=0 R270 | East x=600 R90 | North y=600 R180
# West  (pad1 = i_clk, pad2 = i_nRst)
placeInstance pad1  0.0   240.0 R270 -fixed
placeInstance pad2  0.0   300.0 R270 -fixed
placeInstance pad6  0.0   360.0 R270 -fixed   ;# PADVSSIOR
placeInstance pad7  0.0   420.0 R270 -fixed   ;# PADVDDIOR
placeInstance pad8  0.0   480.0 R270 -fixed   ;# PADVSS
placeInstance pad9  0.0   540.0 R270 -fixed   ;# PADVDD
# North (pad5 = o_led_ctrl)
placeInstance pad5  240.0 600.0 R180 -fixed
placeInstance pad18 300.0 600.0 R180 -fixed   ;# PADVSSIOR
placeInstance pad19 360.0 600.0 R180 -fixed   ;# PADVDDIOR
placeInstance pad20 420.0 600.0 R180 -fixed   ;# PADVSS
placeInstance pad21 480.0 600.0 R180 -fixed   ;# PADVDD
# East  (pad4 = o_tx)
placeInstance pad4  600.0 240.0 R90  -fixed
placeInstance pad14 600.0 300.0 R90  -fixed   ;# PADVSSIOR
placeInstance pad15 600.0 360.0 R90  -fixed   ;# PADVDDIOR
placeInstance pad16 600.0 420.0 R90  -fixed   ;# PADVSS
placeInstance pad17 600.0 480.0 R90  -fixed   ;# PADVDD
# South (pad3 = i_rx)
placeInstance pad3  240.0 0.0   R0   -fixed
placeInstance pad10 300.0 0.0   R0   -fixed   ;# PADVSSIOR
placeInstance pad11 360.0 0.0   R0   -fixed   ;# PADVDDIOR
placeInstance pad12 420.0 0.0   R0   -fixed   ;# PADVSS
placeInstance pad13 480.0 0.0   R0   -fixed   ;# PADVDD

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
