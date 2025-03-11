module ram(
    input clk,
    input [5:0] r_addr,
    input [5:0] w_addr,
    input w_en,
    input [11:0] w_data,
    output [11:0] r_data
    );
   
reg [11:0] memorie_efectiva [0:63];
     
assign r_data=memorie_efectiva[r_addr];    

always@(posedge clk)
    begin
        if(w_en)
            begin
                memorie_efectiva[w_addr]<=w_data;
            end
    end
endmodule
