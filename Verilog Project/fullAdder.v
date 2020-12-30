// Source : Lecture video For EECS 3201 
module fullAdder (a0,a1,carry_in,s,carry_out);

input a0,a1,carry_in;
output s,carry_out;

assign s = (a0 ^ a1) ^ carry_in;
assign carry_out = (a0 & a1 & carry_in)|(a0 & a1 & ~carry_in)|(a0 & ~a1 & carry_in)|(~a0 & a1 & carry_in);

endmodule 