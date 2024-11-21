`timescale 1ns / 1ps

module srff_using_jkdt(input s,r,clk,reset,
                       output q_jk,q_d,q_t);
                       
wire w1,w2,w3;
//sr ff using jk
jk_flipflop jk(.j(s),.k(r),.clk(clk),.reset(reset),.q(q_jk));
// sr ff using d ff
assign w1=~r&q_d;
assign w2=s|w1;
d_flipflop dff(.d(w2),.clk(clk),.reset(reset),.q(q_d));
//sr ff using t ff
assign w3=((s&~q_t)|(r&q_t));
t_flipflop tff(.t(w3),.clk(clk),.reset(reset),.q(q_t));
                    
endmodule

