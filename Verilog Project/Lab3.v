module Lab3(a0,a1,s,hex5,hex3,hex0,hex1,minus_hex);

input [3:0]a0,a1;
input s;
output [0:6]hex5,hex3,hex0,hex1;
output minus_hex;

wire c,d,e,f;
wire [3:0] b;
reg [3:0] temp_a1;
reg [3:0] temp_b;
reg [4:0] second_add;
//parameter extra = 1'b0;
reg [6:0] out1;

  always	@(*) // check add or subtract
  begin
       
		 if(s==1)
		    begin
			    temp_a1 = ~a1;
			 end
		 else
		    begin
			    temp_a1 = a1;
			 end
  
  end
		
			fullAdder fa0(a0[0],temp_a1[0],s,b[0],c);  
			fullAdder fa1(a0[1],temp_a1[1],c,b[1],d);
			fullAdder fa2(a0[2],temp_a1[2],d,b[2],e);
			fullAdder fa3(a0[3],temp_a1[3],e,b[3],f);
			//extra = b[4];
			
  always	@(*) // for extra out 1 of addition on hex1
  begin
       
		 if(f==1 && s==0)
		    begin
				 //second_add = 4'b0001; // show 1
				 //extra = 1'b1;
				 out1 = 7'b1111001;
				 temp_b = b;
			 end
		 else if(f==0 && s==1)
		    begin
				 //second_add = 4'b0000; // this case when cout =0 so show minus
				 //extra = 1'b0;
				 out1 = 7'b0111111;
				 temp_b = ~b + 1'b1;    // *** LEFT IS to turn off the display in addition 
				                        // Show negative on display 
			 end
		 else
		    begin
				 //second_add = 4'b0000;  //to turn hex off
				 //extra = 1'b1;
				 out1 = 7'b1111111;
				 temp_b = b;
			 end
  
  end
          
			//Lab l1(second_add,hex1);
			//generate
			  //if(extra==1)
			   //Lab l1(second_add,hex1); // to display a negative sign
			//endgenerate 
			assign hex1 = out1;
			
		   Lab l5(a0,hex5);
			Lab l3(a1,hex3);
			Lab l0(temp_b,hex0);
		   

endmodule 

// hex code from my lab 2

module Lab(a,seg);

   input [0:3]a;
   output [0:6]seg;
   //assign c = ~(a & b);
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


module minus(a,seg);

   input [0:3]a;
   output [0:6]seg;
   //assign c = ~(a & b);
	hex2 t1(seg,a);
	
endmodule

module hex2(out,H);

  input  [3:0] H;
  output [6:0]out;

	assign out[0] = 1'b1;
	assign out[1] = 1'b1;
	assign out[2] = 1'b1;
	assign out[3] = 1'b1;
	assign out[4] = 1'b1;
	assign out[5] = 1'b1;
	assign out[6] = 1'b0;


endmodule