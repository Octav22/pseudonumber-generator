module lut(
    input [3:0] addr,
    output reg [3:0] data
    );
    
always@(*)
    begin
        data={addr[0], addr[1], addr[2] ,addr[3]};
    end    
endmodule
