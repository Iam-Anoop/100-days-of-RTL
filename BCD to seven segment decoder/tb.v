`timescale 1ns / 1ps

module tb();
reg [3:0]bcd;
wire [6:0]segment;
integer i;

bcdtosevensegment dut(.bcd(bcd),.segment(segment));

task inputdrive;
    begin
        for(i=0;i<10;i=i+1) begin
            bcd=i;
            #10;
            end
    end
endtask

initial 
begin
$monitor("time=%0t|bcd=%d|segment=%b",$time,bcd,segment);
inputdrive;
$finish;
end
            
            
        
    



endmodule
