`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 14:31:56
// Design Name: 
// Module Name: control
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


module control(clk_1Hz, rst, count_en, latch_en, clear);  
  input clk_1Hz;  
  input rst;  
  output count_en;  
  output latch_en;  
  output clear;  
  reg [1:0] state; //状态信号，用于控制各种使能信号  
  reg count_en;  
  reg latch_en;  
  reg clear;  
  always @(posedge clk_1Hz or negedge rst)  
  if(!rst)   //复位信号有效  
    begin    //各种使能信号清零  
      state <= 2'b00;  
      count_en <= 1'b0;  
      latch_en <=1'b0;  
      clear <= 1'b0;  
    end  
     else    //遇到基准信号的下一个上升沿，状态变化一次，每次变化后状态持续1s  
    begin  
      case(state)  
        2'b00:   
            begin //第一个上升沿到达，开始计数，计数1个基准信号周期内待测信号的上升沿个数，此个数即为待测信号的频率  
            count_en <= 1'b1;  //计数使能信号有效  
            latch_en <= 1'b0;  
            clear <= 1'b0;  
            state <= 2'b01;  
          end  
        2'b01:  
          begin //第二个上升沿到达，计数完成，锁存使能信号有效，测得频率锁存至锁存器中  
            count_en <= 1'b0;  
            latch_en <=1'b1;  
            clear <= 1'b0;  
            state <= 2'b10;  
          end
        2'b10:  
            begin //第三个上升沿到达，计数完成，锁存使能信号有效，测得频率锁存至锁存器中  
            count_en <= 1'b0;  
            latch_en <=1'b1;  
            clear <= 1'b0;  
            state <= 2'b10;  
           end    
        2'b11:   
          begin //第四个上升沿到达，清零使能信号有效，计数器清零，为下一次计数做准备  
            count_en <= 1'b0;  
            latch_en <=1'b0;  
            clear <= 1'b1;  
            state <= 2'b00; //状态清零，进入下一次测量  
          end  
        default:  
          begin  
            count_en <= 1'b0;  
            latch_en <=1'b0;  
            clear <= 1'b0;  
            state <= 2'b00;  
          end  
            
      endcase  
            
    end  
    
    
endmodule
