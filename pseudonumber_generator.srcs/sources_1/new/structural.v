module structural(
    input [11:0] seed,
    input [11:0] prev,
    output [3:0] data_out
    );
    
    wire [3:0] adder_1_out;
    
    adder adder_1(
    .in0(2*prev),
    .in1(prev),
    .in2(4),
    .out(adder_1_out)
    );
    
    mux_structural mux_structural_0(
    .in0(prev[3:0]),
    .in1(prev[7:4]),
    .in2(prev[11:8]),
    .in3(adder_1_out),
    .sel(seed[11:10]),
    .out(data_out)
    );
    
endmodule
