module test1(a,b,c,x,y);

input a,b,c;
output x,y;

assign x = a ^ b ^ c;
assign y = (a & b) | (a & c) | (b & c);

endmodule