`timescale 1 ns/10 ps

module mytest();

reg a,b,c;

initial begin
// fill in this blank
   a = 1;
	b = 0;
	c = 0;
	#50;
	
	a = 0;
	b = 0;
	c = 0;
	#50;
	
	a = 0;
	b = 1;
	#100;
	
	a = 1;
	b = 1;
end

always
begin
	if (b == 1)
	begin
		c = ~c;
		#20;
		if (c == 1)
		  $display("Hello World!");
	end
	else
	begin
		#50;
	end
end
endmodule
