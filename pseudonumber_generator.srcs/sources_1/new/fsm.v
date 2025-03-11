module fsm(
    input start,
    input stop,
    input [11:0] seed,
    input [11:0] prev,
    input clk,
    input rst,
    output reg [3:0] data_out
    );
    
    reg [1:0] stare;
    localparam [1:0] stare_initiala=0, adunare=1 , idle=2;
    
    always@(posedge clk)
        begin 
            if(rst)
                begin
                    stare<=stare_initiala;
                    data_out<=seed[11:8];
                end
             else
                case(stare)
                    stare_initiala:
                        begin
                            if(stop)
                                begin
                                    stare<=idle;
                                    data_out<=data_out;
                                end
                                else 
                                    begin
                                        if(start)
                                            begin
                                                stare<=adunare;
                                                data_out<=data_out+data_out;
                                            end
                                        else 
                                            begin
                                                stare<=stare_initiala;
                                                data_out<=data_out;
                                            end        
                                    end
                        end
                        
                    adunare:
                        begin
                            if(stop)
                                begin
                                    stare<=idle;
                                    data_out<=data_out;
                                end
                            else
                                begin
                                    stare<=adunare;
                                    data_out<=data_out+data_out;
                                end         
                        end
                   
                    idle:
                        begin
                            if(start)
                                begin
                                    stare<=adunare;
                                    data_out<=data_out+data_out;
                                end 
                            else
                                begin    
                                    stare<=idle;
                                    data_out<=data_out;
                                end    
                        end          
                         
                endcase   
        end
    
endmodule
