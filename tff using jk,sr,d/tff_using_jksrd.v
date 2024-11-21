`timescale 1ns / 1ps

module tff_using_jksrd( input t,clk,reset,
                        output q_jk,q_sr,q_d);
                        
wire w1,w2,w3;

jk_flipflop jk(.j(t),.k(t),.clk(clk),.reset(reset),.q(q_jk));

assign w1=t&~q_sr;
assign w2=t&q_sr;
sr_flipflop sr(.s(w1),.r(w2),.clk(clk),.reset(reset),.q(q_sr));

assign w3=t^q_d;
d_flipflop d(.d(w3),.clk(clk),.reset(reset),.q(q_d));

endmodule
