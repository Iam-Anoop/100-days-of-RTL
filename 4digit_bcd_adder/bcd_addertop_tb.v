`timescale 1ns / 1ps
module bcd_adder_top_tb();
reg [15:0]a,b;
reg cin;
wire cout;
wire[15:0]sum;
integer i;
bcd_adder4digit_top dut(.a(a),.b(b),.sum(sum),.cin(cin),.cout(cout));

task initialise;
begin
    a=16'd0;
    b=16'd0;
    cin=0;
end
endtask

task inputdrive; 
reg [3:0]digit1, digit2, digit3, digit4;
begin
    
    for(i=0;i<5;i=i+1) begin
        // Generate 4 random digits (0 to 9) for each input
            digit1 = $random % 10;
            digit2 = $random % 10;
            digit3 = $random % 10;
            digit4 = $random % 10;

            // Concatenate the digits to form 16-bit BCD values
            a = {digit1, digit2, digit3, digit4};
            b = {digit1, digit2, digit3, digit4};
            cin=0;
        #10;
        end
    for(i=0;i<5;i=i+1) begin
        // Generate 4 random digits (0 to 9) for each input
            digit1 = $random % 10;
            digit2 = $random % 10;
            digit3 = $random % 10;
            digit4 = $random % 10;

            // Concatenate the digits to form 16-bit BCD values
            a = {digit1, digit2, digit3, digit4};
            b = {digit1, digit2, digit3, digit4};
            cin=1;
        #10;
        end
end
endtask

//calling task
initial 
begin
$monitor("time=%0t|a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
initialise;
#10;
inputdrive;
#50;
$finish;
end

        
            
endmodule