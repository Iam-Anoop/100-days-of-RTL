`timescale 1ns / 1ps



module carrylookahead_adder_8bit( input[7:0]a,b,
                                  input cin,
                                  output [7:0]sum,
                                  output cout);
                                  
wire [7:0]g,p;
reg [8:0]carry;//from c[1] is the carry out generate from adding each bit from 0 to 7
integer i;

assign g=a&b;
assign p=a^b;

always@(*)
begin
    carry[0]=cin;
    for(i=0;i<8;i=i+1)
        carry[i+1]=g[i]|(p[i]&carry[i]);
end

assign sum=p^carry[7:0];
assign cout=carry[8];        
    
                                  
endmodule
