`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2020 09:30:27 PM
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(ForwardA, ForwardB, Rs, Rt, ExMemReg, MemWBReg);



output reg [1:0] ForwardA, ForwardB;
//forward 0 = no forward, forward 1 = ExMem forward, forward 2 = MemWB forward
input [4:0] Rs, Rt, ExMemReg, MemWBReg; 

always @ (*) begin

if (ExMemReg != Rs && ExMemReg != Rt && MemWBReg != Rs && MemWBReg != Rt) begin //1
    ForwardA = 2'b00;
    ForwardB = 2'b00; 
 end
 if (ExMemReg == Rs && ExMemReg != Rt && MemWBReg != Rs && MemWBReg != Rt) begin //2
    ForwardA = 2'b01;
    ForwardB = 2'b00; 
 end
 if (ExMemReg != Rs && ExMemReg == Rt && MemWBReg != Rs && MemWBReg != Rt) begin //3
    ForwardA = 2'b00;
    ForwardB = 2'b01; 
 end
 if (ExMemReg == Rs && ExMemReg == Rt && MemWBReg != Rs && MemWBReg != Rt) begin //4
    ForwardA = 2'b01;
    ForwardB = 2'b01; 
 end
if (ExMemReg != Rs && ExMemReg != Rt && MemWBReg == Rs && MemWBReg != Rt) begin //5
    ForwardA = 2'b10;
    ForwardB = 2'b00; 
end
if (ExMemReg != Rs && ExMemReg != Rt && MemWBReg != Rs && MemWBReg == Rt) begin //6
    ForwardA = 2'b00;
    ForwardB = 2'b10; 
end    
if (ExMemReg != Rs && ExMemReg != Rt && MemWBReg == Rs && MemWBReg == Rt) begin //7
    ForwardA = 2'b10;
    ForwardB = 2'b10; 
 end
 if (ExMemReg == Rs && ExMemReg != Rt && MemWBReg != Rs && MemWBReg == Rt) begin //8
    ForwardA = 2'b01;
    ForwardB = 2'b10; 
 end
 if (ExMemReg != Rs && ExMemReg == Rt && MemWBReg == Rs && MemWBReg != Rt) begin //9
    ForwardA = 2'b10;
    ForwardB = 2'b01; 
 end
 
 
 if (ExMemReg == Rs && ExMemReg != Rt && MemWBReg == Rs && MemWBReg != Rt) begin //10
    ForwardA = 2'b01; //change
    ForwardB = 2'b00; 
 end
if (ExMemReg != Rs && ExMemReg == Rt && MemWBReg != Rs && MemWBReg == Rt) begin //11
    ForwardA = 2'b00;
    ForwardB = 2'b01; //change
end
if (ExMemReg == Rs && ExMemReg == Rt && MemWBReg == Rs && MemWBReg != Rt) begin //12
    ForwardA = 2'b01; //change
    ForwardB = 2'b01; 
end
if (ExMemReg == Rs && ExMemReg == Rt && MemWBReg != Rs && MemWBReg == Rt) begin //13
    ForwardA = 2'b01;
    ForwardB = 2'b01; //change
end
 if (ExMemReg == Rs && ExMemReg != Rt && MemWBReg == Rs && MemWBReg == Rt) begin //14
    ForwardA = 2'b01; //change
    ForwardB = 2'b10; 
end
if (ExMemReg != Rs && ExMemReg == Rt && MemWBReg == Rs && MemWBReg == Rt) begin //15
    ForwardA = 2'b10;
    ForwardB = 2'b01; //change
end
if (ExMemReg == Rs && ExMemReg == Rt && MemWBReg == Rs && MemWBReg == Rt) begin //16
    ForwardA = 2'b01; //change
    ForwardB = 2'b01; //change
end



end
endmodule
