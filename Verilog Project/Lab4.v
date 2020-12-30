`timescale 1ps/1ps
module Lab4(s,clk,rst,rst1,hex0,hex1 );

input clk;
input rst,s,rst1;
output [0:6]hex0,hex1;

reg [7:0] Q;
reg [7:0] Q_temp;
reg enable;
wire new_clk;
initial	Q = 5'b11000;
initial	enable = 1'b1;

reg[31:0] count = 32'd0;
parameter D = 32'd50000000;  // decrease little to slow

always @(posedge clk)
begin
	count <= count + 32'd1;
	if (count >= D-1)
	begin
	 count <= 32'd0;
    if (rst == 1'b0 && s==0)
        Q <= 5'b11000;
	 else if (rst == 1'b0 && s==1)
	     Q <= 5'b11110;
	 else if (rst1 == 0)
	 begin 
		  if (enable == 1)
		   enable <= 0;
		  else
		   enable <= 1;
	 end
    else if(Q != 0 && enable == 1)  // can I use switch to stop clock?
        Q <= Q - 1'b1;
	end
end

assign cout = (count < D/2) ? 1'b0 : 1'b1;  // increase little to slow

   Lab l0(Q[3:0],hex0);
	Lab l1(Q[7:4],hex1);

endmodule

// hex display from lab 2
module Lab(a,seg);

   input [0:3]a;
   output [0:6]seg;
	hex zero(seg,a);
	
endmodule

module hex(out,H);

  input  [3:0] H;
  output [6:0]out;

	assign out[0] = (~H[3]&~H[2]&~H[1]&H[0])|(~H[3]&H[2]&~H[1]&~H[0])|(H[3]&~H[2]&H[1]&H[0])|(H[3]&H[2]&~H[1]&H[0]);
	assign out[1] = (~H[3]&H[2]&~H[1]&H[0])|(~H[3]&H[2]&H[1]&~H[0])|(H[3]&~H[2]&H[1]&H[0])|(H[3]&H[2]&~H[1]&~H[0])|(H[3]&H[2]&H[1]&~H[0])|(H[3]&H[2]&H[1]&H[0]);
	assign out[2] = (~H[3]&~H[2]&H[1]&~H[0])|(H[3]&H[2]&~H[1]&~H[0])|(H[3]&H[2]&H[1]&~H[0])|(H[3]&H[2]&H[1]&H[0]);
	assign out[3] = (~H[3]&~H[2]&~H[1]&H[0])|(~H[3]&H[2]&~H[1]&~H[0])|(~H[3]&H[2]&H[1]&H[0])|(H[3]&~H[2]&~H[1]&H[0])|(H[3]&~H[2]&H[1]&~H[0])|(H[3]&H[2]&H[1]&H[0]);
	assign out[4] = (~H[3]&~H[2]&~H[1]&H[0])|(~H[3]&~H[2]&H[1]&H[0])|(~H[3]&H[2]&~H[1]&~H[0])|(~H[3]&H[2]&~H[1]&H[0])|(~H[3]&H[2]&H[1]&H[0])|(H[3]&~H[2]&~H[1]&H[0]);
	assign out[5] = (~H[3]&~H[2]&~H[1]&H[0])|(~H[3]&~H[2]&H[1]&~H[0])|(~H[3]&~H[2]&H[1]&H[0])|(~H[3]&H[2]&H[1]&H[0])|(H[3]&H[2]&~H[1]&H[0]);
	assign out[6] = (~H[3]&~H[2]&~H[1]&~H[0])|(~H[3]&~H[2]&~H[1]&H[0])|(~H[3]&H[2]&H[1]&H[0])|(H[3]&H[2]&~H[1]&~H[0]);


endmodule
