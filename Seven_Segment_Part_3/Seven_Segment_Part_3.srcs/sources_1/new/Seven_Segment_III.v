`timescale 1ns / 1ns

module Seven_Segment_III(
    input [15:0] sw,       //16 switch inputs
    input BTN,             //button
    input rst,             //reset button
    input clk,             
    
    output reg [6:0] seg,  //segment display
    output reg [3:0] an    //led selector
    
    );
    
    
// init

    reg[3:0] led;          // which of four leds
    wire[1:0] selector;    // select which segment to display on
    
    reg [1:0] ledout = 0;  // ledout register for clk divider
    reg [28:0] clkdiv;
    wire clk;
    
// clock divider
    
    // the first 18-bit for creating 2.6ms digit period
    // count        0    ->  1  ->  2  ->  3
    // activates    LED1    LED2   LED3   LED4
    // and repeat
    always @(posedge clk)
        begin
            if (clkdiv == 400000) 
                begin
                    if (ledout > 3)
                        begin
                            ledout <= 0;
                            clkdiv <= 0;
                        end
                    else
                        begin
                            ledout <= ledout +1;
                            clkdiv <= 0;
                    end
                end
                
            else 
                begin
                    clkdiv <= clkdiv +1;
                    ledout <= ledout;
                end
        end
    assign selector = ledout;
    
    
    //then make selector change accordingly. 
    
    
    
// multiplexer
    always @(*)
    begin
        case(selector)
        2'b00: 
            begin
                an = 4'b0111; 
                // activate LED1 and Deactivate LED2, LED3, LED4
                led = sw[15:12];
                // the first hex-digit of the 16-bit number
            end
        2'b01: 
            begin
                an = 4'b1011; 
                // activate LED2 and Deactivate LED1, LED3, LED4
                led = sw[11:8];
                // the second hex-digit of the 16-bit number
            end
        2'b10: 
            begin
                an = 4'b1101; 
                // activate LED3 and Deactivate LED2, LED1, LED4
                led = sw[7:4];
                // the third hex-digit of the 16-bit number
            end
        2'b11:
            begin
                an = 4'b1110; 
                // activate LED4 and Deactivate LED2, LED3, LED1
                led = sw[3:0];
                // the fourth hex-digit of the 16-bit number 
            end   
        default:
            begin
                an = 4'b0111; 
                // activate LED1 and Deactivate LED2, LED3, LED4
                led = sw[15:11];
                // the first hex-digit of the 16-bit number
            end
        endcase
    end
    
    
// buttons and segment display
always @ (posedge clk or posedge rst)
    begin
        //reset wipes everything off the display
        if(rst)
            begin
                seg <= 7'b1111111;
            end
        else
            begin
                //decode the 4-bit binary to decimal on BTN press
                if (BTN)
                    begin
                        case (led)
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
                    end 
            end
    end


endmodule
