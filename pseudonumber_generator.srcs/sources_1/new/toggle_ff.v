module toggle_ff(
    input clk,
    input rst,
    input tgl,
    output reg data
    );
    
always@(posedge clk)
    begin
        if(rst)
            data<=0;
        else
            if(tgl)
                data<=~data;
    end
endmodule
