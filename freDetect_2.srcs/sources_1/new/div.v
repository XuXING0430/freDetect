`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 14:31:02
// Design Name: 
// Module Name: div
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


module div(
    input clk_100mhz,
    output clk_190hz,
    output reg clk_1Hz,
    output reg fin
    );
	reg [9:0] cnt0;
	reg [30:0] cnt;
	reg [18:0] cnt1;
	
	always @(posedge clk_100mhz)
		cnt1 = cnt1 + 1;
	assign clk_190hz = cnt1[18];
	always @(posedge clk_100mhz)
		if(cnt == 50000000) begin
			cnt = 0;
			clk_1Hz = ~clk_1Hz;
		    end
		else
			cnt = cnt + 1;
	always @(posedge clk_100mhz)
		if(cnt0 == 641) begin  //78000hz
			cnt0 = 0;
			fin = ~fin;
		end
		else
			cnt0 = cnt0 + 1;

endmodule
