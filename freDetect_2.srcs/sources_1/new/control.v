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
  reg [1:0] state; //״̬�źţ����ڿ��Ƹ���ʹ���ź�  
  reg count_en;  
  reg latch_en;  
  reg clear;  
  always @(posedge clk_1Hz or negedge rst)  
  if(!rst)   //��λ�ź���Ч  
    begin    //����ʹ���ź�����  
      state <= 2'b00;  
      count_en <= 1'b0;  
      latch_en <=1'b0;  
      clear <= 1'b0;  
    end  
     else    //������׼�źŵ���һ�������أ�״̬�仯һ�Σ�ÿ�α仯��״̬����1s  
    begin  
      case(state)  
        2'b00:   
            begin //��һ�������ص����ʼ����������1����׼�ź������ڴ����źŵ������ظ������˸�����Ϊ�����źŵ�Ƶ��  
            count_en <= 1'b1;  //����ʹ���ź���Ч  
            latch_en <= 1'b0;  
            clear <= 1'b0;  
            state <= 2'b01;  
          end  
        2'b01:  
          begin //�ڶ��������ص��������ɣ�����ʹ���ź���Ч�����Ƶ����������������  
            count_en <= 1'b0;  
            latch_en <=1'b1;  
            clear <= 1'b0;  
            state <= 2'b10;  
          end
        2'b10:  
            begin //�����������ص��������ɣ�����ʹ���ź���Ч�����Ƶ����������������  
            count_en <= 1'b0;  
            latch_en <=1'b1;  
            clear <= 1'b0;  
            state <= 2'b10;  
           end    
        2'b11:   
          begin //���ĸ������ص������ʹ���ź���Ч�����������㣬Ϊ��һ�μ�����׼��  
            count_en <= 1'b0;  
            latch_en <=1'b0;  
            clear <= 1'b1;  
            state <= 2'b00; //״̬���㣬������һ�β���  
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
