module test2(clk,a,r);

input clk,a;
output reg[3:0] r = 4'd0;

always @(posedge clk)
begin

	if (a == 0)
	begin
		if (r == 4'd15)
			r <= 0;
		else
			r <= r + 4'd1;
	end
	else
	begin
		if (r == 4'd0)
			r <= 15;
		else
			r <= r - 4'd1;
	end
		
end

endmodule