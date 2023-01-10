// A 2x1 mux module using dataflow abstraction level
module muxDataFlow (a, b, sel, z);
input  wire a, b, sel; // Direction | Data type
output  wire z;        // Direction | Data type
// assign based code
assign z = (a & ~sel) | (b & sel);
endmodule
