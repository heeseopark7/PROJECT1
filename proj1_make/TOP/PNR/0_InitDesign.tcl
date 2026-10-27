
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
##################################################
floorPlan -site CoreSite -s 99.18 99.18 450.41 450.41 450.41 450.41

## Move IO Cells (PADVDD, PADVSS)
selectInst pad8
placeInstance pad8 0.0 580.0 R270
selectInst pad9
placeInstance pad9 0.0 650.0 R270
selectInst pad12
placeInstance pad12 510.0 0.0 R0
selectInst pad13
placeInstance pad13 580.0 0.0 R0
selectInst pad16
placeInstance pad16 760.0 510.0 R90
selectInst pad17
placeInstance pad17 760.0 580.0 R90
selectInst pad20
placeInstance pad20 510.0 760.0 R180
selectInst pad21
placeInstance pad21 580.0 760.0 R180

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
