`timescale 1ns / 1ps

module test2_tb();

reg clk;
reg a;
wire [3:0] r;

test2 t2(.clk(clk),.a(a),.r(r));

always
begin
   clk = 1'b1;
	#10;
	clk = 1'b0;
	#10;
end

initial
begin

   a = 0;
	 #100;
		
	a = 1;
	 #200;
		
	a = 0;
	
end

always @(posedge clk)
begin
    
    if (r == 4'b0000)
	    $display("All outputs are zero");
	 
end


endmodule