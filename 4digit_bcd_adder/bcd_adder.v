`timescale 1ns / 1ps
module bcd_adder(input [3:0]a,b,
                 input cin,
                 output reg[3:0]sum,
                 output reg cout);
                 reg [3:0]temp_sum;
                 
always@(*)
begin
    temp_sum=a+b+cin;
    if(temp_sum>9||cout==1) begin //we know to add 6 to the bcd obtained sum when it exceed binary eq of 9 or the cout ==1 eg:bcd addition of 9+9 give 18 whose binary eq is 10010 where we get sum as 0010
        sum=temp_sum+6;
        cout=1;
        end
    else begin
        sum=temp_sum;
        cout=0;
        end
end
                   
endmodule