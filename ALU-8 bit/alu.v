`timescale 1ns / 1ps

module alu( input[7:0]a,b,
            input[3:0]opcode,
            input enable,                               //output enable
            output[15:0]out);
            
parameter ADD=4'b0000,
          INC=4'b0001,
          SUB=4'b0010,
          DEC=4'b0011,
          MUL=4'b0100,
          DIV=4'b0101,
          SHL=4'b0110,
          SHR=4'b0111,
          AND=4'b1000,
          OR=4'b1001,
          INV=4'b1010,
          NAND=4'b1011,
          NOR=4'b1100,
          XOR=4'b1101,
          XNOR=4'b1110,
          BUFF=4'b1111;            
            
reg [15:0]temp; //internal reg to store data while operation
          
always@(*)
begin 
temp=0;  
    case(opcode)
    ADD:temp=a+b;
    SUB:temp=a-b;
    INC:temp=a+1'b1;
    DEC:temp=a-1'b1;
    MUL:temp=a*b;
    DIV:temp=a/b;
    AND:temp=a&b; 
    OR:temp=a|b;
    INV:temp=~a;
    NAND:temp=~(a&b);
    NOR:temp=~(a|b);
    XOR:temp=a^b;
    XNOR:temp=a~^b;
    BUFF:temp=a;
    SHL:temp=a<<1;
    SHR:temp=a>>1;
    default:temp=16'd0;
    endcase
end

assign out=(enable)?temp:16'hzzzz;
              
endmodule
