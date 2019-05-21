`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2019 09:49:25 PM
// Design Name: 
// Module Name: Seven_Segment_tb
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


module Seven_Segment_tb();

    reg [3:0] bcd;
    wire [6:0] seg;
    integer i;
    
    //Unit Under Test Initalization
    Seven_Segment uut ( .BCD(bcd), .seg(seg) );
    
    initial begin
    
        //provide all combination of BCD
        bcd = 4'b0000;
        #10 bcd = 4'b0001;
        #10 bcd = 4'b0010;
        #10 bcd = 4'b0011;
        
        #10 bcd = 4'b0100;
        #10 bcd = 4'b0101;
        #10 bcd = 4'b0110;
        #10 bcd = 4'b0111;
        
        #10 bcd = 4'b1000;
        #10 bcd = 4'b1001;
        // all don't care values now
        
        #10 $finish;
    end
    
endmodule
