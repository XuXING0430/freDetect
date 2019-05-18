`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 16:50:32
// Design Name: 
// Module Name: latch
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


module latch(clk_1Hz, latch_en, rst, q0, q1, q2, q3, q4, q5, q6, q7,  
            d0, d1, d2, d3, d4, d5, d6, d7);  
              
  input clk_1Hz, latch_en, rst;  
  input[3:0] q0, q1, q2, q3, q4, q5, q6, q7;  
  output[3:0] d0, d1, d2, d3, d4, d5, d6, d7;  
  reg[3:0] d0, d1, d2, d3, d4, d5, d6, d7;  
  always@ (posedge clk_1Hz or negedge rst)  
  if(!rst) //复位信号有效时输出清零  
    begin  
      d0 <= 4'b0; d1 <= 4'b0; d2 <= 4'b0; d3 <= 4'b0; d4 <= 4'b0;  
      d5 <= 4'b0; d6 <= 4'b0; d7 <= 4'b0;  
    end  
  else if(latch_en) //锁存信号有效时，将计数器的输出信号锁存至锁存器  
    begin  
      d0 <= q0; d1 <= q1; d2 <= q2; d3 <= q3; d4 <= q4;  
      d5 <= q5; d6 <= q6; d7 <= q7;  
    end  
     else  //上面两种情况均未发生时，输入不变  
    begin  
      d0 <= d0; d1 <= d1; d2 <= d2; d3 <= d3; d4 <= d4;  
      d5 <= d5; d6 <= d6; d7 <= d7;  
    end  
  
endmodule
