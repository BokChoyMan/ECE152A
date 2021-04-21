CXX = iverilog

CXXFLAGS = '-Wall' '-g2012'

BINARIES = floatadd

COMMON_FILES = design.sv

floatadd: Lab_03_float_add_tb.sv
	${CXX} -o $@ ${CXXFLAGS} ${COMMON_FILES} $^

clean: 
	/bin/rm -f ${BINARIES} dump.vcd