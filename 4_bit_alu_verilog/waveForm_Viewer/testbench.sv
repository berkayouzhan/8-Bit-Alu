// testbench.sv
`timescale 1ns/1ps
module testbench;

reg [3:0] operandA, operandB;
reg [2:0] operation;
  wire [7:0] result;
wire zeroFlag;

ALU myALU (
    .operandA(operandA),
    .operandB(operandB),
    .operation(operation),
    .result(result),
    .zeroFlag(zeroFlag)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    operandA = 4'b1101;
    operandB = 4'b1010;
    operation = 3'b000; // Addition
    #10;

    operandA = 4'b1101;
    operandB = 4'b1010;
    operation = 3'b001; // Subtraction
    #10;

    operandA = 4'b1101;
    operandB = 4'b1010;
    operation = 3'b010; // Bitwise AND
    #10;

    operandA = 4'b1101;
    operandB = 4'b1010;
    operation = 3'b011; // Bitwise OR
    #10;

    operandA = 4'b1101;
    operandB = 4'b1010;
    operation = 3'b100; // Multiplication
    #10;

    $finish;
end

endmodule
