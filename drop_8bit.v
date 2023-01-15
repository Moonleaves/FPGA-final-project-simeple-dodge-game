//drop fuction
module drop_8bit(output reg[7:0]A_count, input CLK, drop, init);
divfreq10Hz F1(CLK, CLK_div);
//mode == 0 shift right, mode == 1 shift left
initial begin
 A_count = 8'b11111110;
end
always@(posedge CLK_div)
	if(!init) A_count = 8'b11111110;
	else if(drop)//shift left
		A_count <= {A_count[6:0],A_count[7]};
	else if(!drop)
	;
endmodule

module drop_8bit2(output reg[7:0]A_count, input CLK, drop, init);
divfreq1Hz F1(CLK, CLK_div);
//mode == 0 shift right, mode == 1 shift left
initial begin
 A_count = 8'b11111110;
end
always@(posedge CLK_div)
	if(!init) A_count = 8'b11111110;
	else if(drop)//shift left
		A_count <= {A_count[6:0],A_count[7]};
	else if(!drop)
	;
endmodule
