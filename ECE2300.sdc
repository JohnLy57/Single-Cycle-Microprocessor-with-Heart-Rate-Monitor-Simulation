## Generated SDC file "ECE2300.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

## DATE    "Sat Aug 15 16:30:30 2015"

##
## DEVICE  "5CEBA4F23C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLK50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLK50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {clkdiv} -source [get_ports {CLK50}] -divide_by 5 -master_clock {CLK50} [get_nets {clockGenerator|var_clock}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clkdiv}] -rise_to [get_clocks {clkdiv}] -setup 0.290  
set_clock_uncertainty -rise_from [get_clocks {clkdiv}] -rise_to [get_clocks {clkdiv}] -hold 0.280  
set_clock_uncertainty -rise_from [get_clocks {clkdiv}] -fall_to [get_clocks {clkdiv}] -setup 0.290  
set_clock_uncertainty -rise_from [get_clocks {clkdiv}] -fall_to [get_clocks {clkdiv}] -hold 0.280  
set_clock_uncertainty -fall_from [get_clocks {clkdiv}] -rise_to [get_clocks {clkdiv}] -setup 0.290  
set_clock_uncertainty -fall_from [get_clocks {clkdiv}] -rise_to [get_clocks {clkdiv}] -hold 0.280  
set_clock_uncertainty -fall_from [get_clocks {clkdiv}] -fall_to [get_clocks {clkdiv}] -setup 0.290  
set_clock_uncertainty -fall_from [get_clocks {clkdiv}] -fall_to [get_clocks {clkdiv}] -hold 0.280  
set_clock_uncertainty -rise_from [get_clocks {CLK50}] -rise_to [get_clocks {CLK50}] -setup 0.280  
set_clock_uncertainty -rise_from [get_clocks {CLK50}] -rise_to [get_clocks {CLK50}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {CLK50}] -fall_to [get_clocks {CLK50}] -setup 0.280  
set_clock_uncertainty -rise_from [get_clocks {CLK50}] -fall_to [get_clocks {CLK50}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {CLK50}] -rise_to [get_clocks {CLK50}] -setup 0.280  
set_clock_uncertainty -fall_from [get_clocks {CLK50}] -rise_to [get_clocks {CLK50}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {CLK50}] -fall_to [get_clocks {CLK50}] -setup 0.280  
set_clock_uncertainty -fall_from [get_clocks {CLK50}] -fall_to [get_clocks {CLK50}] -hold 0.270  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

