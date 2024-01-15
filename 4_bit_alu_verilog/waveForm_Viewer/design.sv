// design.sv
`timescale 1ns/1ps
module ALU (
    input [3:0] operandA,
    input [3:0] operandB,
    input [2:0] operation,
  output reg [7:0] result,
    output reg zeroFlag
);

always @* begin
    case(operation)
        3'b000: result <= operandA + operandB; // Addition
        3'b001: result <= operandA - operandB; // Subtraction
        3'b010: result <= operandA & operandB; // Bitwise AND
        3'b011: result <= operandA | operandB; // Bitwise OR
        3'b100: result <= operandA * operandB; // Multiplication
        default: result <= 4'b0000; // Default to 0 for unknown operation
    endcase

    zeroFlag <= (result == 4'b0000) ? 1 : 0; // Set zero flag
end

endmodule