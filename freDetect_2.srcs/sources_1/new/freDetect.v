`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 14:33:24
// Design Name: 
// Module Name: freDetect
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


module freDetect(clk_100mhz,rst,duan,wei);  
  input clk_100mhz;  
  input rst; //复位信号  
  output [7:0] duan; 
  output [7:0] wei;  
  wire[3:0] q0, q1, q2, q3, q4, q5, q6, q7;   //中间数据  
  wire[3:0] d0, d1, d2, d3, d4, d5, d6, d7;
  wire fin;
  wire clk_1Hz;
  wire clk_190hz;
  div u_div( 
             .clk_1Hz(clk_1Hz),
             .clk_190hz(clk_190hz),
             .clk_100mhz(clk_100mhz),
             .fin(fin)
                ); 
                
  IP_seg_disp u_IP_seg_disp( .clk_190hz(clk_190hz),
                           .d0(d0), 
                           .d1(d1), 
                           .d2(d2), 
                           .d3(d3),  
                           .d4(d4), 
                           .d5(d5), 
                           .d6(d6), 
                           .d7(d7),
                           .duan(duan), 
                           .wei(wei)
                            );
  //控制模块实例  
  control u_control(.clk_1Hz(clk_1Hz), .rst(rst), .count_en(count_en),  
                    .latch_en(latch_en), .clear(clear));  
    
  //计数器模块实例  
  counter_10 counter0(.en_in(count_en), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out0), .q(q0));  
  counter_10 counter1(.en_in(en_out0), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out1), .q(q1));  
  counter_10 counter2(.en_in(en_out1), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out2), .q(q2));  
  counter_10 counter3(.en_in(en_out2), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out3), .q(q3));  
  counter_10 counter4(.en_in(en_out3), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out4), .q(q4));  
  counter_10 counter5(.en_in(en_out4), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out5), .q(q5));  
  counter_10 counter6(.en_in(en_out5), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out6), .q(q6));  
  counter_10 counter7(.en_in(en_out6), .clear(clear), .rst(rst),  
                      .fin(fin), .en_out(en_out7), .q(q7));  
    
  //锁存器模块实例  
  latch u_latch(.clk_1Hz(clk_1Hz), .rst(rst), .latch_en(latch_en),  
                .q0(q0), .q1(q1), .q2(q2), .q3(q3), .q4(q4), .q5(q5),  
                .q6(q6), .q7(q7), .d0(d0), .d1(d1), .d2(d2), .d3(d3),  
                .d4(d4), .d5(d5), .d6(d6), .d7(d7));  
     
endmodule
