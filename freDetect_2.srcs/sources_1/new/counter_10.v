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
  input en_in; //����ʹ���ź�  
  input rst;   //��λ�ź�  
  input clear; //�����ź�  
  input fin;   //�����ź�  
  output en_out; //���ʹ�ܣ����ڿ�����һ����������״̬�������ʹ����Чʱ����һ��ģ10������������1  
  output [3:0] q; //�������������4λBCD�����  
    
  reg en_out;  
  reg [3:0] q;  
    
  always@ (posedge fin or negedge rst) //��������źŵ���������Ϊ�����ź�  
  if(!rst) //��λ�ź���Ч���������������  
      begin  
        en_out <= 1'b0;  
        q <= 4'b0;  
      end  
        
    else if(en_in) //��λ����ʹ���ź���Ч  
      begin  
        if(q == 4'b1001) //��q = 4'b1001�Ļ���q���㣬ͬʱ��λ���ʹ����Ч����en_out ��ֵΪ1'b1  
          begin  
            q <= 4'b0;  
            en_out <= 1'b1;  
          end  
             else //��qδ�ﵽ4'b1001ʱ��ÿ��������źŵ�һ�������أ�q��1��ͬʱ�����λ����  
          begin  
            q <= q + 1'b1;  
            en_out <=1'b0;  
          end  
      end  
        
    else if(clear) //�������ź���Ч�����������㣬��Ҫ����Ϊ��һ�β���׼��  
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
