`timescale 1ns / 1ps

module boothmultiplier(input signed [7:0]m,q,
                       output reg signed [15:0]result);

reg[8:0] a;
reg[7:0]q_reg;
reg q1;
integer i;

always@(*)
begin 
//initialise
    a=9'd0;
    q_reg=8'd0;
    q1=1'b0;
    result=16'd0;
//operation start    
    for(i=0;i<8;i=i+1)begin
        case({q_reg[0],q1})
        2'b01:a=a+m;
        2'b10:a=a-m;
        default:a=a; //for 00 and 11 no operation just arith right shift needed
        endcase
        
        //arith right shift
        a=a>>>1;
        q_reg=q_reg>>>1;
        q1=q[i];//q1 need to be updated such that after every right shift the last bit of q need to reach q1
        end
        
        result={a[7:0],q_reg};
end        
        
    
                           

endmodule
