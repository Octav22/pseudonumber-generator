`timescale 1ns / 1ps
module Testbench(
    );
    
    reg start;
    reg clk;
    reg rst;
    reg [5:0] addr_r;
    reg stop;
    reg [11:0] seed;
    wire [11:0] data_read;
    wire [11:0] data_current;
    
    Top dut(
        .start(start),
        .clk(clk),
        .rst(rst),
        .addr_r(addr_r),
        .stop(stop),
        .seed(seed),
        .data_read(data_read),
        .data_current(data_current)
    );
    
    initial
        begin
            clk=0;
            #10
            clk=1;
            forever 
                begin
                    #5 clk=~clk;
                end
        end
     
     
     initial
        begin
            rst<=1;
            #30 rst<=0;
        end   
      
     initial
        begin
            start<=0;
            #50 start<=1;
            #10 start<=0;
            #30 start<=1;
            #10 start<=0;
            #50 start<=1;
            #10 start<=0;
        end 
        
     initial
        begin
            stop<=0;
            #60 stop<=1;
            #10 stop<=0;
            #40 stop<=1;
            #10 stop<=0;
            #70 stop<=1;
            #10 stop<=0;
        end   
        
     initial 
        begin
            seed<=12'b0000_0000_0000;
            #30 seed<=12'b0000_0000_0011;
            #70 seed<=12'b1100_1100_0001;
        end   
     initial
        begin
             addr_r<=0;
             #70 addr_r<=1;
        end
        
        
     initial
        begin
            #220 $stop();
        end      
        
endmodule
