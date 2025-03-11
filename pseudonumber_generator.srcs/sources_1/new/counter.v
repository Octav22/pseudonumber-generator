module counter #(parameter N=4)(
    input clk,
    input rst,
    input en,
    output reg [N-1:0] data
    );
    
always@(posedge clk)
    begin
        if(rst)
            begin
                data<=0;
            end
        else
            begin
                if(en)
                    begin
                        data<=data+1;
                    end
                else
                    begin
                        data<=data;
                    end   
            end    
    end    
endmodule
