`timescale 1ns / 1ps

module jkff_using_srdt( input j,k,clk,reset,
                        output q_sr,q_d,q_t);
                        
wire w1,w2,w3,w4;

assign w1=j&~q_sr;
assign w2=k&q_sr;
sr_flipflop sr(.s(w1),.r(w2),.q(q_sr),.clk(clk),.reset(reset));

assign w3=(~k&q_d)|(j&~q_d);
d_flipflop d(.d(w3),.clk(clk),.reset(reset),.q(q_d));

assign w4=(k&q_t)|(j&~q_t);
t_flipflop t(.t(w4),.clk(clk),.reset(reset),.q(q_t));
                        
endmodule
