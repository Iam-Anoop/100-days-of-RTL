`timescale 1ns / 1ps

module alu_tb();
reg [7:0]a,b;
reg enable;
reg[3:0]opcode;
wire[15:0]out;

alu dut(.a(a),.b(b),.enable(enable),.opcode(opcode),.out(out));

task initialise;
begin
a=8'd0;
b=8'd0;
enable=0;
end
endtask

task add;
begin  
$display("\n Testing ADD operation");
    enable=1;
    opcode=4'd0;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task inc;
begin 
$display("\n Testing INCREMENT operation");  
    enable=1;
    opcode=4'd1;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task sub;
begin
$display("\n Testing SUB operation");   
    enable=1;
    opcode=4'd2;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task dec;
begin
$display("\n Testing DECREMENT operation");   
    enable=1;
    opcode=4'd3;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task mul;
begin   
$display("\n Testing MULTIPLICATION operation");
    enable=1;
    opcode=4'd4;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task div;
begin 
$display("\n Testing DIVISION operation");  
    enable=1;
    opcode=4'd5;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task shl;
begin  
$display("\n Testing SHL operation"); 
    enable=1;
    opcode=4'd6;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task shr;
begin   
$display("\n Testing SHR operation");
    enable=1;
    opcode=4'd7;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task And;
begin 
$display("\n Testing AND operation");  
    enable=1;
    opcode=4'd8;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task Or;
begin 
$display("\n Testing OR operation");  
    enable=1;
    opcode=4'd9;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task inv;
begin 
$display("\n Testing INVERT operation");  
    enable=1;
    opcode=4'd10;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task Nand;
begin   
$display("\n Testing NAND operation");
    enable=1;
    opcode=4'd11;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task Nor;
begin   
$display("\n Testing NOR operation");
    enable=1;
    opcode=4'd12;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task Xor;
begin   
$display("\n Testing XOR operation");
    enable=1;
    opcode=4'd13;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task Xnor;
begin   
$display("\n Testing XNOR operation");
    enable=1;
    opcode=4'd14;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

task buff;
begin   
$display("\n Testing BUFFER operation");
    enable=1;
    opcode=4'd15;
    repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end 
endtask

initial
begin
$monitor("Time=%0t|opcode = %b|input A= %d|input B= %d|enable=%b|out=%d",$time,opcode,a,b,enable,out);
    initialise;
    #10;
    add;
    inc;
    sub;
    dec;
    mul;
    div;
    shl;
    shr;
    And;
    Or;
    inv;
    Nand;
    Nor;
    Xor;
    Xnor;
    buff;
    #10;
    $finish;
end    
       
     
endmodule
