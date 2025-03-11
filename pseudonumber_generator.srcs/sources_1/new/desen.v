module desen(
    input start,
    input stop,
    input clk,
    input rst,
    input [11:0] prev,
    input [11:0] seed,
    output [3:0] data_out
    );
    
    wire toggle_ff_0_out;
    
    toggle_ff toggle_ff_0(
        .clk(clk),
        .rst(rst),
        .tgl(start & stop),
        .data(toggle_ff_0_out)
    );
    
    wire [3:0] counter_0_out;
    
    counter counter_0(
        .clk(clk),
        .rst(rst),
        .en(toggle_ff_0_out),
        .data(counter_0_out)
    );
    
      
    wire [3:0] adder_0_out;
      
    adder adder_0(
        .in0(seed),
        .in1(prev),
        . in2(counter_0_out),
        .out(adder_0_out)
    );
    
    lut lut_0(
        .addr(adder_0_out),
        .data(data_out)
        );
    
endmodule
