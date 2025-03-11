module Top(
    input start,
    input clk,
    input rst,
    input [5:0] addr_r,
    input stop,
    input [11:0] seed,
    output [11:0] data_read,
    output [11:0] data_current
    );
    
    wire [3:0] desen_0_out;
    wire [11:0] delay_reg_0_out;
    
    desen desen_0(
        .start(start),
        .stop(stop),
        .clk(clk),
        .rst(rst),
        .prev(delay_reg_0_out),
        .seed(seed),
        .data_out(desen_0_out)
    );
    
    
    wire [3:0] structural_0_out;
    
    structural structural_0(
        .seed(seed),
        .prev(delay_reg_0_out),
        .data_out(structural_0_out)
    );
    
    wire [3:0] fsm_0_out;
    
    fsm fsm_0(
        .start(start),
        .stop(stop),
        .seed(seed),
        .prev(delay_reg_0_out),
        .clk(clk),
        .rst(rst),
        .data_out(fsm_0_out)
    );
    
    
    wire [5:0] counter_1_out;
    
    counter #(.N(6)) counter_1(
        .clk(clk),
        .rst(rst),
        .en(stop),
        .data(counter_1_out)
    );
    
    
    delay_reg delay_reg_0(
        .clk(clk),
        .rst(rst),
        .data_in({desen_0_out, structural_0_out, fsm_0_out}),
        .data_out(delay_reg_0_out)
    );
    
    ram ram_0(
        .clk(clk),
        .r_addr(addr_r),
        .w_addr(counter_1_out),
        .w_en(stop),
        .w_data(delay_reg_0_out),
        .r_data(data_read)
    );
    
    assign data_current = {desen_0_out, structural_0_out, fsm_0_out};
    
endmodule
