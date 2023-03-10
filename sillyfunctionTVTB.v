`timescale 1ns/1ps
// Self-cheking test bench with test vectors
// for the silly function example
module sillyfunctionTVTB();
reg clk, reset;         // clock and reset are internal
reg a, b, c, yexpected; // values from testvectors
wire y;                 // output of circuit
reg [31:0] vectornum, errors; // bookkeeping variables
reg [3:0] testvectors[10000:0];// array of testvectors

// instantiate device under test
sillyfunction dut(.a(a), .b(b), .c(c), .y(y) );

// generate clock
always // no sensitivity list, so it always executes
begin clk = 1; #5; clk = 0; #5; // 10ns period
end

// at start of test, load vectors and pulse reset
initial	// Will execute at the beginning once
begin	
	// Read vectors binary
	$readmemb("example.tv", testvectors); 	
	vectornum = 0; errors = 0;	// Initialize
	reset = 1; #27; reset = 0;	// Apply reset wait
end
// Note: $readmemh reads testvector files written in hexadecimal

// apply test vectors on rising edge of clk
always @(posedge clk)
begin
#1; {a, b, c, yexpected} = testvectors[vectornum];
end

// check results on falling edge of clk
always @(negedge clk)
if (~reset) // skip during reset
begin
if (y !== yexpected)
begin
$display("Error: inputs = %b", {a, b, c});
$display("outputs = %b (%b exp)",y,yexpected);
errors = errors + 1;
end
// Note: to print in hexadecimal, use %h. For example,
// $display("Error: inputs = %h", {a, b, c});

// increment array index and read next testvector
vectornum = vectornum + 1;
if (testvectors[vectornum] === 4'bx)
	begin
		$display("%d tests completed with %d errors", vectornum, errors);
		$finish; // End simulation
	end
end
endmodule

