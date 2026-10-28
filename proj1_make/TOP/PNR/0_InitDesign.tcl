########################################
# InitDesign (Setup, Floorplan)  -- uart_top
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
## Floorplan :: CHIP AREA (840, 840)
##   cell area (Genus netlist) = 501.7 um^2
##   core   = 16 rows x 1.71 = 27.36 (square, ratio 1.0) -> util = 501.7/748.6 = 0.67
##   die D  = 840 = 240(corner) + 6 x 60(pad slots) + 240(corner)   (pad 21개 -> 변당 6칸)
##   margin = (840 - 27.36) / 2 = 406.32  (pad depth 240 + 166 for ring)
##################################################
floorPlan -site CoreSite -s 27.36 27.36 406.32 406.32 406.32 406.32
 
## Place IO cells (lower-left corner of each pad, die coordinates)
##   South y=0 R0 | West x=0 R270 | East x=D-240=600 R90 | North y=600 R180
##   slots per side: 240 300 360 420 480 540
# West  : IO power + core power
placeInstance pad6  0.0   300.0 R270 -fixed   ;# PADVSSIOR
placeInstance pad7  0.0   360.0 R270 -fixed   ;# PADVDDIOR
placeInstance pad8  0.0   420.0 R270 -fixed   ;# PADVSS
placeInstance pad9  0.0   480.0 R270 -fixed   ;# PADVDD
# South
placeInstance pad10 240.0 0.0   R0   -fixed   ;# PADVSSIOR
placeInstance pad11 300.0 0.0   R0   -fixed   ;# PADVDDIOR
placeInstance pad1  360.0 0.0   R0   -fixed   ;# i_clk
placeInstance pad2  420.0 0.0   R0   -fixed   ;# i_nRst
placeInstance pad12 480.0 0.0   R0   -fixed   ;# PADVSS
placeInstance pad13 540.0 0.0   R0   -fixed   ;# PADVDD
# East
placeInstance pad14 600.0 240.0 R90  -fixed   ;# PADVSSIOR
placeInstance pad15 600.0 300.0 R90  -fixed   ;# PADVDDIOR
placeInstance pad3  600.0 360.0 R90  -fixed   ;# i_rx
placeInstance pad4  600.0 420.0 R90  -fixed   ;# o_tx
placeInstance pad16 600.0 480.0 R90  -fixed   ;# PADVSS
placeInstance pad17 600.0 540.0 R90  -fixed   ;# PADVDD
# North
placeInstance pad18 300.0 600.0 R180 -fixed   ;# PADVSSIOR
placeInstance pad19 360.0 600.0 R180 -fixed   ;# PADVDDIOR
placeInstance pad5  420.0 600.0 R180 -fixed   ;# o_led_ctrl
placeInstance pad20 480.0 600.0 R180 -fixed   ;# PADVSS
placeInstance pad21 540.0 600.0 R180 -fixed   ;# PADVDD
 
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