module mux_structural(
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [1:0] sel,
    output reg [3:0] out
    );
    
    always@(*)
        begin
            case(sel)
                    0:
                        out=in0;
                    
                    1:
                        out=in1;    
                    
                    2:
                        out=in2;    
                        
                    3:
                        out=in3;            
            endcase
        end
endmodule
