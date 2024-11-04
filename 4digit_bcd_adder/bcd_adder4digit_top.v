`timescale 1ns / 1ps



module bcd_adder4digit_top(input [15:0]a,b,
                           input cin,
                           output[15:0]sum,
                           output cout);
                           
                           wire ya,yb,yc;
                           
//first digit of a and that of b bcd adder
bcd_adder bcdadder0(.a(a[3:0]),.b(b[3:0]),.sum(sum[3:0]),.cin(cin),.cout(ya)); 
//adder to add 2nd ,3rd and 4th digit
bcd_adder bcdadder1(.a(a[7:4]),.b(b[7:4]),.sum(sum[7:4]),.cin(ya),.cout(yb));
bcd_adder bcdadder2(.a(a[11:8]),.b(b[11:8]),.sum(sum[11:8]),.cin(yb),.cout(yc));
bcd_adder bcdadder3(.a(a[15:12]),.b(b[15:12]),.sum(sum[15:12]),.cin(yc),.cout(cout)); 
                         
endmodule
