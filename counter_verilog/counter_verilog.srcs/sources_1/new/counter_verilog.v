`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 01:50:35 PM
// Design Name: 
// Module Name: counter_verilog
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


module counter_verilog(
    input clk,
    output [7:0] ledout
    );
    
reg[7:0] ledout = 0 ;
reg[28:0] clkdiv;
wire clk;

always @ (posedge clk)
   if(clkdiv == 100000000) 
       begin
          ledout <= ledout + 1;
          clkdiv <= 0;
       end
   
       else begin
              clkdiv <= clkdiv +1;
              ledout <= ledout;
       end
   
endmodule
