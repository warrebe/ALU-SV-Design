#!/bin/bash

# Create the work library
if [ ! -d "work" ]; then
   echo "work library does not exist"
   vlib work
fi

# Compile the SV file.
if [ -s alu.sv ]; then
   vlog alu.sv
fi

vsim alu.sv -do gate_do.do

# For design-vision, create dv_script
echo "analyze -format sverilog -lib WORK alu.sv" >| script$$
echo "elaborate alu -lib WORK" >> script$$
echo "compile" >> script$$
echo "report_timing > timing.txt" >> script$$
echo "report_area > area.txt" >> script$$
echo "report_hierarchy > hierarchy.txt" >> script$$
echo "write -hierarchy -format verilog -output alu.gate.v" >> script$$
echo "quit" >> script$$
cp script$$ dv_script
rm script$$

# Synthesize the design by runnig dv_script that just created.
dc_shell-xg-t -f dv_script

