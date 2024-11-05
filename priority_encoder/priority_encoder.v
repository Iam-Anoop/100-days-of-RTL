`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anoop 
// 
// Create Date: 05.11.2024 13:31:22
// Design Name: priority encoderr 8:3

//////////////////////////////////////////////////////////////////////////////////


module priority_encoder( input[7:0]datain,
                         output reg[2:0]dataout);
                         
always@(*)
    begin
        case(1'b1)//reverse case for priority instead of nested if elseif
        //we know normal case check the value to the expression parallel but reverse case check each expression to the value like sequential
        datain[7]:dataout=111; //highest priority
        datain[6]:dataout=110;//next priority
        datain[5]:dataout=101;
        datain[4]:dataout=100;
        datain[3]:dataout=011;
        datain[2]:dataout=010;
        datain[1]:dataout=001;
        datain[0]:dataout=000;
        default:dataout=0;
        endcase
    end                             
endmodule
