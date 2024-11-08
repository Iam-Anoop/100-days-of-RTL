`timescale 1ns / 1ps

module subtract_4bitbinary( input [3:0]A,B,
                            output[3:0]diff,
                            output cout);
 //cin of full adder to be driven with 0 to get subtraction done                           
wire[2:0]carry;//intermediate wires to connect between cin and cout of full adders
wire[3:0]B_comp;

//finding 2s complement of b and assigning to variable B_comp
assign B_comp=~B + 4'b0001;

//instantiate fulladder module 4 times to add input A and B_comp
fulladder fa0(.a(A[0]),.b(B_comp[0]),.cin(1'b0),.sum(diff[0]),.cout(carry[0]));
fulladder fa1(.a(A[1]),.b(B_comp[1]),.cin(carry[0]),.sum(diff[1]),.cout(carry[1]));
fulladder fa2(.a(A[2]),.b(B_comp[2]),.cin(carry[1]),.sum(diff[2]),.cout(carry[2]));
fulladder fa3(.a(A[3]),.b(B_comp[3]),.cin(carry[2]),.sum(diff[3]),.cout(cout));
// if the sum we get with cout =0 then the sum is negative so to get the exact negative number we need to get its 2s complement it again to get the number in decimal
// here we know we get 2s complement as diff                    
endmodule
