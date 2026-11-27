`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2026 15:48:27
// Design Name: 
// Module Name: TB_BIT2_boothmulti
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


module TB_BIT2_boothmulti;

    reg  signed [1:0] M;
    reg  signed [1:0] Q;
    wire signed [3:0] P;

    BIT2_boothmulti uut (
        .M(M),
        .Q(Q),
        .P(P)
    );

    integer i, j;

    initial begin
        $display(" M  *  Q  =  P  (Expected)");
        $display("---------------------------");
        for (i = -2; i <= 1; i = i + 1) begin
            for (j = -2; j <= 1; j = j + 1) begin
                M = i;
                Q = j;
                #10;
                $display("%2d  * %2d  = %2d  (%2d) %s",
                    M, Q, P, M * Q, (P === M * Q) ? "PASS" : "FAIL");
            end
        end
        $finish;
    end

endmodule
