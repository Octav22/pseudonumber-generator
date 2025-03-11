module adder(
    input [11:0] in0,
    input [11:0] in1,
    input [3:0] in2,
    output [3:0] out
    );

wire [13:0] suma=in0+in1+{8'd0,in2}; //pentru a evita overflow-ul in cazul de valori maxime pe intrari

assign out=suma[3:0];

endmodule
