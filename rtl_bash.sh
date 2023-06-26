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

# For design-vision, create dv_script
echo "analyze -format sverilog -lib WORK alu.sv" >| script$$
echo "elaborate alu -lib WORK" >> script$$
echo "compile" >> script$$
echo "report_timing > timing.txt" >> script$$
echo "report_area > area.txt" >> script$$
echo "write -hierarchy -format verilog -output alu.rtl.v" >> script$$
echo "quit" >> script$$
cp script$$ dv_script
rm script$$

# Synthesize the design by runnig dv_script that just created.
dc_shell-xg-t -f dv_script

# To simulate the gate design, compile the code.
mkdir rtl_src
mv *.v rtl_src/
cp *.sv rtl_src/
cd rtl_src/

vsim alu -c do rtl_do.do
