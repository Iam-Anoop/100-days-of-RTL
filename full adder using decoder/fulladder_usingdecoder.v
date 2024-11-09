`timescale 1ns / 1ps



module fulladder_usingdecoder(input[2:0]in,
                              output sum,carry,
                              output reg [7:0]m);
                              
                              
                              
always@(*)
begin  
    m=8'd0; 
    case(in)
    3'd0:m[0]=1'b1;
    3'd1:m[1]=1'b1;
    3'd2:m[2]=1'b1;
    3'd3:m[3]=1'b1;
    3'd4:m[4]=1'b1;
    3'd5:m[5]=1'b1;
    3'd6:m[6]=1'b1;
    3'd7:m[7]=1'b1;
    default:m=8'd0;
    endcase
end

assign sum=m[1]|m[2]|m[4]|m[7];//in full adder if the inputs have odd number of 1's then sum is 1
assign carry=m[3]|m[5]|m[6]|m[7]; // in full adder carry is 1 when there are 2 or more 1
//from table of full adder we can write minterm expnsion of sum and carry then we get the above expression

                                
endmodule
