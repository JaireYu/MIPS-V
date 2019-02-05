`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:24 04/07/2018 
// Design Name: 
// Module Name:    regfile 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module regfile_copy_DMem(
	input	clk,
	input rst_n,
	input [4:0] rAddr,//����ַ
	output [31:0] rDout,//������
	input [4:0] wAddr,//д��ַ
	input [31:0] wDin,//д����
	input wEna//дʹ��
);
	reg [31:0] data [0:31];
	integer i;
	assign rDout=data[rAddr];//��1
	always@(posedge clk or negedge rst_n)//д�͸�λ
		if(~rst_n)
		begin
			for(i=0; i<32; i=i+1) data[i]<=0;
			//data[0]<=32'h12345678;
			//data[1]<=32'h13132323;
			//data[2]<=32'h58585858;
			//data[3]<=32'habcdefab;
		end
		else
		begin
			if(wEna)
				data[wAddr]<=wDin;
		end
endmodule
