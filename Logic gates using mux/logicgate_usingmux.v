`timescale 1ns / 1ps

module logicgate_usingmux(input A,B,
                          output notout,andout,orout,xorout,xnorout,nandout,norout);
                          
mux2to1 notgate(.I({0,1}),.S(A),.Y(notout)); // not gate
mux2to1 orgate(.I({1,B}),.S(A),.Y(orout)); //or gate
mux2to1 andgate(.I({B,0}),.S(A),.Y(andout)); // and gate
mux2to1 xorgate(.I({~B,B}),.S(A),.Y(xorout));// xor
mux2to1 xnorgate(.I({B,~B}),.S(A),.Y(xnorout)); //xnor
mux2to1 nandgate(.I({~B,1}),.S(A),.Y(nandout)); //nand logic
mux2to1 norgate(.I({0,~B}),.S(A),.Y(norout)); //nor
                          
endmodule
