
########################################
# CTS & Optimization
########################################
restoreDesign PlaceOpt.dat
file mkdir reports/timing/postCTS reports/clock
# Target about skew
set_ccopt_property target_skew 0.01  

create_ccopt_clock_tree_spec
# CTS and report all timing WNS, TNS results
ccopt_design

# Propagated Clock
set_interactive_constraint_modes [all_constraint_modes -active] ;# set_propagated_clock command needs the existing mode is active  :: Mode is named FUNC and you can check with the command 'all_constraint_modes command'
set_propagated_clock [all_clocks]

# Check right-after CTS
timeDesign -postCTS -outDir reports/timing/postCTS
report_ccopt_clock_trees -file reports/clock/clock_trees.rpt
report_ccopt_skew_groups -file reports/clock/skew_groups.rpt
report_clock_timing -type skew -nworst 5 > reports/clock/skew.rpt

# Optimization of my design after CTS
optDesign -postCTS 	; # Setup/DRV concurrently
optDesign -postCTS -hold ;# Only for hold violation

########################################
# Manual hold(removal) fix on i_nRst -> RN pins
#  optDesign -hold leaves WNS -0.015ns (removal check, async_default group)
#  -> add CLKBUFX4 in series on the net that drives the RN pins (2 buffers)
########################################
proc add_hold_buf {net name} {
    ecoAddRepeater -net $net -cell CLKBUFX4 -name $name
    # new buffer touches 2 nets: the old one (input) and the new one (output)
    set nets [dbGet [dbGet -p top.insts.name $name].instTerms.net.name]
    return [lsearch -inline -not -exact $nets $net]
}

if {[dbGet -p top.nets.name FE_PHN9_i_nRst] != "0x0"} {
    set n1 [add_hold_buf FE_PHN9_i_nRst FE_MANUAL_HOLD_nRst]
    set n2 [add_hold_buf $n1 FE_MANUAL_HOLD_nRst2]
    refinePlace
} else {
    puts "WARN: net FE_PHN9_i_nRst not found -> check the net name of the FE_PHC chain end and fix this block"
}

timeDesign -postCTS -outDir reports/timing/postCTS
timeDesign -postCTS -outDir reports/timing/postCTS -hold

# If there is no error, Save Design
saveDesign -def PostCTSopt

exit
