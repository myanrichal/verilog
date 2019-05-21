`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 01:54:28 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(

    );
    
    reg clk;
    wire[7:0] ledout;
    
    counter_verilog c1(
       .clk(clk),
       .ledout(ledout)
     );
     
     initial begin
        clk = 0;
     end
     
     always #10 clk = !clk;
     initial #1000 $finish;
    
endmodule