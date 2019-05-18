`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 14:59:51
// Design Name: 
// Module Name: IP_seg_disp
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


module IP_seg_disp(
    input clk_190hz,
    input [3:0] d0, 
    input [3:0] d1, 
    input [3:0] d2, 
    input [3:0] d3, 
    input [3:0] d4, 
    input [3:0] d5, 
    input [3:0] d6, 
    input [3:0] d7,
    output reg [7:0] duan,
    output reg [7:0] wei
    );
    
    reg [3:0] disp;
    reg [2:0] smg_ctl;
    
    always @ ( posedge clk_190hz)
        smg_ctl = smg_ctl + 1'b1;
	 always @ (*)
        case ( smg_ctl )
        3'b000:begin
            wei = 8'b11111110;
            disp = d0 [3:0];
        end
        3'b001:begin
            wei = 8'b11111101;
            disp = d1 [3:0];
        end
        3'b010:begin
            wei = 8'b11111011;
            disp = d2 [3:0];
        end
        3'b011:begin
            wei = 8'b11110111;
            disp = d3 [3:0];
        end
        3'b100:begin
            wei = 8'b11101111;
            disp = d4 [3:0];
        end
        3'b101:begin
            wei = 8'b11011111;
            disp = d5 [3:0];
        end
        3'b110:begin
            wei = 8'b10111111;
            disp = d6 [3:0];
        end
        3'b111:begin
            wei = 8'b01111111;
            disp = d7 [3:0];
        end          
        default:;
        endcase

    always @ ( * )
        case (disp)
        4'b0000:duan = 8'b11000000;
        4'b0001:duan = 8'b11111001;
        4'b0010:duan = 8'b10100100;
        4'b0011:duan = 8'b10110000;
        4'b0100:duan = 8'b10011001;
        4'b0101:duan = 8'b10010010;
        4'b0110:duan = 8'b10000010;
        4'b0111:duan = 8'b11111000;
        4'b1000:duan = 8'b10000000;
        4'b1001:duan = 8'b10010000;
        4'b1010:duan = 8'b10001000;
        4'b1011:duan = 8'b10000011;
        4'b1100:duan = 8'b11000110;
        4'b1101:duan = 8'b10100001;
        4'b1110:duan = 8'b10000110;
        4'b1111:duan = 8'b11111111;
        default:duan = 8'b11000000;
        endcase
endmodule

