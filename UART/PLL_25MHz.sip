set_global_assignment -entity "PLL_25MHz" -library "lib_PLL_25MHz" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_25MHz" -library "lib_PLL_25MHz" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "PLL_25MHz" -library "lib_PLL_25MHz" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_25MHz" -name SPD_FILE [file join $::quartus(sip_path) "PLL_25MHz.spd"]

set_global_assignment -library "lib_PLL_25MHz" -name MISC_FILE [file join $::quartus(sip_path) "PLL_25MHz_sim/PLL_25MHz.vo"]
