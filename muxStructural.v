// A 2x1 mux module using primitives to accomplish
// a structural abstraction level
module muxStructural (a, b, sel, z);
input  wire a, b, sel; // Direction | Data type
output  wire z;        // Direction | Data type

// Internal wires        
wire w_nsel, w_and2, w_and3; // Direction not necessary
                             // for internal wires
// Verilog primitives
// primitives | Instance name | Instance ports
not U1 (w_nsel, sel);
and U2 (w_and2, a, w_nsel);
and U3 (w_and3, b, sel);
or  U4 (z, w_and2, w_and3);
endmodule
