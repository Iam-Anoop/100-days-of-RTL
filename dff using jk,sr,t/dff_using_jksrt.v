`timescale 1ns / 1ps

module dff_using_jksrt(input d,clk,reset,
                       output q_jk,q_sr,q_t);
                       
wire w1;

jk_flipflop jk(.j(d),.k(~d),.clk(clk),.reset(reset),.q(q_jk));

sr_flipflop sr(.s(d),.r(~d),.clk(clk),.reset(reset),.q(q_sr));

assign w1=d^q_t;
t_flipflop t(.t(w1),.clk(clk),.reset(reset),.q(q_t)); 
                      
endmodule
