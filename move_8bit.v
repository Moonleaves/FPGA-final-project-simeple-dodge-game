//move function
module move_8bit(output reg[7:0]A_count, input CLK, left, right, init);
divfreq7Hz F0(CLK, CLK_div);
//mode == 0 shift right, mode == 1 shift left
initial begin
 A_count = 8'b01111111;
end
always@(posedge CLK_div)
	if(!init) A_count = 8'b01111111;
	else if(left && A_count[7])//shift left && it is not in the left edge 
		 A_count <= {A_count[6:0],A_count[7]};
	else if(right && A_count[0])//shift right && it is not in the right edge 
		 A_count <= {A_count[0],A_count[7:1]};
endmodule
