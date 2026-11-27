`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2026 15:41:51
// Design Name: 
// Module Name: 2BIT_boothmulti
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BIT2_boothmulti(
    input  wire signed [1:0] M, // 2-bit signed multiplicand (-2 to +1)
    input  wire signed [1:0] Q, // 2-bit signed multiplier (-2 to +1)
    output reg  signed [3:0] P  // 4-bit signed product (-4 to +4)
);

    reg signed [2:0] A;         // 3-bit accumulator (extra bit prevents overflow for -2 * -2)
    reg signed [2:0] M_ext;     // Sign-extended multiplicand
    reg [1:0] Q_reg;
    reg Q_1;                    // Extra LSB bit for Booth encoding
    reg signed [5:0] combined;  // {A[2:0], Q_reg[1:0], Q_1}
    integer i;

    
      always @(*) begin
            A     = 3'sb000;
            M_ext = {M[1], M};
            Q_reg = Q;
            Q_1   = 1'b0;
    
            for (i = 0; i < 2; i = i + 1) begin
                case ({Q_reg[0], Q_1})
                    2'b01: A = A + M_ext;
                    2'b10: A = A - M_ext;
                    default: ;
                endcase
    
                // Arithmetic right shift: duplicate sign bit A[2]
                {A, Q_reg, Q_1} = {A[2], A, Q_reg};
            end
    
            P = {A[1:0], Q_reg};
        end
    

endmodule

   
