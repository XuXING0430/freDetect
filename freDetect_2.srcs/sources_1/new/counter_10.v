`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 14:32:34
// Design Name: 
// Module Name: counter_10
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


module counter_10(en_in, rst, clear, fin, en_out, q);  
  input en_in; //输入使能信号  
  input rst;   //复位信号  
  input clear; //清零信号  
  input fin;   //待测信号  
  output en_out; //输出使能，用于控制下一个计数器的状态，当输出使能有效时，下一个模10计数器计数加1  
  output [3:0] q; //计数器的输出，4位BCD码输出  
    
  reg en_out;  
  reg [3:0] q;  
    
  always@ (posedge fin or negedge rst) //输入待测信号的上升沿作为敏感信号  
  if(!rst) //复位信号有效，计数器输出清零  
      begin  
        en_out <= 1'b0;  
        q <= 4'b0;  
      end  
        
    else if(en_in) //进位输入使能信号有效  
      begin  
        if(q == 4'b1001) //若q = 4'b1001的话，q清零，同时进位输出使能有效，即en_out 赋值为1'b1  
          begin  
            q <= 4'b0;  
            en_out <= 1'b1;  
          end  
             else //若q未达到4'b1001时，每到达待测信号的一个上升沿，q加1，同时输出进位清零  
          begin  
            q <= q + 1'b1;  
            en_out <=1'b0;  
          end  
      end  
        
    else if(clear) //若清零信号有效，计数器清零，主要用于为下一次测量准备  
      begin  
        q <= 4'b0;  
        en_out <= 1'b0;  
      end  
    else  
    begin  
    q <= q;  
    en_out <=1'b0;  
    end   
    
endmodule
