# TCL File Generated by Component Editor 16.1
# Mon May 06 11:36:02 CEST 2019
# DO NOT MODIFY


# 
# gameMemory_avalon_interface "gameMemory_component" v1.0
#  2019.05.06.11:36:02
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module gameMemory_avalon_interface
# 
set_module_property DESCRIPTION ""
set_module_property NAME gameMemory_avalon_interface
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "My Own IP cores"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME gameMemory_component
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL gameMemory_avalon_interface
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file gameMemory_avalon_interface.v VERILOG PATH gameMemory_avalon_interface.v TOP_LEVEL_FILE
add_fileset_file gameMemory.v VERILOG PATH gameMemory.v

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL gameMemory_avalon_interface
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file gameMemory_avalon_interface.v VERILOG PATH gameMemory_avalon_interface.v
add_fileset_file gameMemory.v VERILOG PATH gameMemory.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point avalon_slave_0
# 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressUnits WORDS
set_interface_property avalon_slave_0 associatedClock clock_sink
set_interface_property avalon_slave_0 associatedReset clock_reset
set_interface_property avalon_slave_0 bitsPerSymbol 8
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 burstcountUnits WORDS
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 maximumPendingWriteTransactions 0
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitStates 0
set_interface_property avalon_slave_0 readWaitTime 0
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true
set_interface_property avalon_slave_0 EXPORT_OF ""
set_interface_property avalon_slave_0 PORT_NAME_MAP ""
set_interface_property avalon_slave_0 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0 writedata writedata Input 32
add_interface_port avalon_slave_0 readdata readdata Output 32
add_interface_port avalon_slave_0 write write Input 1
add_interface_port avalon_slave_0 chipselect chipselect Input 1
add_interface_port avalon_slave_0 address address Input 8
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""

add_interface_port clock_sink clock clk Input 1


# 
# connection point clock_reset
# 
add_interface clock_reset reset end
set_interface_property clock_reset associatedClock clock_sink
set_interface_property clock_reset synchronousEdges DEASSERT
set_interface_property clock_reset ENABLED true
set_interface_property clock_reset EXPORT_OF ""
set_interface_property clock_reset PORT_NAME_MAP ""
set_interface_property clock_reset CMSIS_SVD_VARIABLES ""
set_interface_property clock_reset SVD_ADDRESS_GROUP ""

add_interface_port clock_reset resetn reset_n Input 1


# 
# connection point conduit_in
# 
add_interface conduit_in conduit end
set_interface_property conduit_in associatedClock clock_sink
set_interface_property conduit_in associatedReset ""
set_interface_property conduit_in ENABLED true
set_interface_property conduit_in EXPORT_OF ""
set_interface_property conduit_in PORT_NAME_MAP ""
set_interface_property conduit_in CMSIS_SVD_VARIABLES ""
set_interface_property conduit_in SVD_ADDRESS_GROUP ""

add_interface_port conduit_in Q_export data_out Output 32
add_interface_port conduit_in Q_address address Input 8
add_interface_port conduit_in Q_input_data data_in Input 32
add_interface_port conduit_in Q_wren wren Input 1

