`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 05.11.2024 13:31:55
// Design Name: 
// Module Name: priority_encoder_tb

//////////////////////////////////////////////////////////////////////////////////


module priority_encoder_tb();
reg [7:0]datain;
wire[2:0]dataout;

priority_encoder dut(.datain(datain),.dataout(dataout));

task initialise;
datain=8'd0;
endtask

task inputdrive(input[7:0]data);
begin
    datain=data;
    #10;
end
endtask;

//calling task
initial
    begin
        $monitor("Time=%0t|datain=%b|dataout=%b",$time,datain,dataout);
        initialise;
        #10;
        inputdrive(8'b01001111);
        inputdrive(8'b11001101);
        inputdrive(8'b00110010);
        inputdrive(8'b00011100);
        inputdrive(8'b00000101);
        inputdrive(8'b00000001);
        inputdrive(8'b01001111);
        $finish;
    end    
            

endmodule
