module ClockDivider(cin,cout);

// Based on code from fpga4student.com
// cin is the input clock; if from the DE10-Lite,
// the input clock will be at 50 MHz
// The clock divider counts 50 million cycles of the input clock
// before resetting, i.e., it resets once per second
// The output is zero for the first half of the 50 million cycles,
// and 1 for the second half, i.e., it is now a 1 Hz clock

input cin;
output cout;

reg[31:0] count = 32'd0;
parameter D = 32'd37000000;  // decrease little to slow

always @(posedge cin)
begin
	count <= count + 32'd1;
	if (count >= D-1)
		count <= 32'd0;
end

assign cout = (count < D/31999999) ? 1'b0 : 1'b1;  // increase little to slow

endmodule
