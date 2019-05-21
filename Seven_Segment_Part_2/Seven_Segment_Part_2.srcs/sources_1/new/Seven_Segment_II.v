`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2019 12:56:06 AM
// Design Name: 
// Module Name: Seven_Segment_II
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


//module Seven_Segment_II(
//    input [3:0] SW,
//    input BTNC,
//    input clk,
//    input rst,
//    output reg [6:0] seg,
//    output reg [3:0] an
//    );
   
//    reg an = 4'b1110;        //LD10
    
    
//    always @ (posedge clk or posedge rst)
//        begin
//            if(rst)
//                begin
//                    //shut off display
//                    an = 4'b1110;       
//                end
//             else
//                begin
//                    //do nothing
//                   an = 4'b0000;   
//                end
//        end
    
    
//    always @ (BTNC)          //activate if btnC pressed
//        begin
//            if(BTNC)         //if btn pressed
//              case(SW)       //Assign seg according to SW
//                4'b0000: seg = 7'b0000001; // "0"     
//                4'b0001: seg = 7'b1001111; // "1" 
//                4'b0010: seg = 7'b0010010; // "2" 
//                4'b0011: seg = 7'b0000110; // "3" 
//                4'b0100: seg = 7'b1001100; // "4" 
//                4'b0101: seg = 7'b0100100; // "5" 
//                4'b0110: seg = 7'b0100000; // "6" 
//                4'b0111: seg = 7'b0001111; // "7" 
//                4'b1000: seg = 7'b0000000; // "8"     
//                4'b1001: seg = 7'b0000100; // "9" 
//                default: seg = 7'b0000001; // "0"
//              endcase
//            else
//                seg = 7'b1111111; // off
//            end
    
    
//endmodule


module Seven_Segment_II(sw, btnC, clk, rst, seg, an);
input [3:0] sw;
input rst;
input clk;
input btnC;


output [6:0] seg;
output [3:0] an;

reg [6:0] seg;
reg [3:0] an;

reg [28:0] clkdiv;



//always @ (posedge clk or posedge rst)
//    begin
//        if(rst)
//            begin
//                seg <= 7'b1111111;
//                an <= 4'b1110;
//            end
//         else
//            begin
//                seg<= 7'b0000000;
//                an <= 4'b1110;
//            end
//end
 
//always @ (btnC)
always @ (posedge clk or posedge rst)
    begin
        if(rst)
            begin
                seg <= 7'b1111111;
                an <= 4'b1111;
            end
        else
            begin
                if (btnC)
                    begin
                        an <= 4'b1110;
                        case (sw)
                            4'b0000 : seg <= 7'b0000001; 
                            4'b0001 : seg <= 7'b1001111; 
                            4'b0010 : seg <= 7'b0010010; 
                            4'b0011 : seg <= 7'b0000110; 
                            4'b0100 : seg <= 7'b1001100;
                            4'b0101 : seg <= 7'b0100100;
                            4'b0110 : seg <= 7'b0100000;
                            4'b0111 : seg <= 7'b0001111;
                            4'b1000 : seg <= 7'b0000000;
                            4'b1001 : seg <= 7'b0000100;
                            default : seg  = 7'b0000001;
                        endcase
                    end
                else
                    begin
                        seg <= 7'b1111111;
                        an <= 4'b1110;    
                    end
            end
    end
endmodule