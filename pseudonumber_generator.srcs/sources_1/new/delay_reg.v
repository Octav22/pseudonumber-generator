module delay_reg(
    input clk,
    input rst,
    input [11:0] data_in,
    output reg [11:0] data_out
    );
    
always@(posedge clk)
    begin
        if(rst)
            data_out<=0;
         else
            data_out<=data_in;   
    end
endmodule
