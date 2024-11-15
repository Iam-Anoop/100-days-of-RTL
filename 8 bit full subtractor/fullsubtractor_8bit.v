`timescale 1ns/1ps

module fullsubtractor_8bit(input[7:0]a,b,
                           input bin,
                           output[7:0]d,
                           output bout);
                           
//internal wire for borrow propogation such that wire borrow[0 be connecting bin of 1th sub and bout of 0 th sub
wire [7:0]borrow;

genvar i;
generate
    for(i=0;i<8;i=i+1) begin
        if(i==0) begin
            fullsubtractor fs(.a(a[i]),.b(b[i]),.bin(bin),.d(d[i]),.bout(borrow[i]));
            end
         else begin
            fullsubtractor fs(.a(a[i]),.b(b[i]),.bin(borrow[i-1]),.d(d[i]),.bout(borrow[i]));
            end
    end
endgenerate     
    
assign bout=borrow[7];              

endmodule
                            