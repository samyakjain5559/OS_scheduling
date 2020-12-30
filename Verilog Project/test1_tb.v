`timescale 1ns / 1ps

module test1_tb();

reg a;
reg b;
reg c;

wire x;
wire y;

test1 t1(.a(a),.b(b),.c(c),.x(x),.y(y));

initial
begin

   $display("This is a console message");
	
	a = 0;
	b = 0;
	c = 0;
	#20;
	if (x == 0 && y==0)
	    $display("All outputs are zero");
	
   a = 0;
	b = 0;
	c = 1;
	#20;
	if (x == 0 && y == 0)
	    $display("All outputs are zero");
		
	a = 0;
	b = 1;
	c = 0;
	#20;
	if (x == 0 && y == 0)
	    $display("All outputs are zero");
	
   a = 0;
	b = 1;
	c = 1;
	#20
	if (x == 0 && y == 0)
	    $display("All outputs are zero");
		
	a = 1;
	b = 0;
	c = 0;
	#20;
	if (x == 0 && y == 0)
	    $display("All outputs are zero");
		
   a = 1;
	b = 0;
	c = 1;
	#20;
	if (x == 0 && y == 0)
	    $display("All outputs are zero");
		
	a = 1;
	b = 1;
	c = 0;
	#20;
	if (x == 0 && y == 0)
	    $display("All outputs are zero");
		
	a = 1;
	b = 1;
	c = 1;
	#20;
	if (x == 0 && y == 0)
	    $display("All outputs are zero");	
   

end

endmodule