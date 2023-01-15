
//1Hz
module divfreq1Hz(input CLK, output reg CLK_div);
reg[24:0]Count;
always@(posedge CLK) 
 begin
   if(Count>25000000)
	 begin
	  Count<=25'b0;
	  CLK_div <= ~CLK_div;
	 end
	else
		Count<=Count + 1'b1;
 end
endmodule
//3Hz
module divfreq3Hz(input CLK, output reg CLK_div);
reg[24:0]Count;
always@(posedge CLK) 
 begin
   if(Count>8333333)
	 begin
	  Count<=25'b0;
	  CLK_div <= ~CLK_div;
	 end
	else
		Count<=Count + 1'b1;
 end
endmodule
//5Hz
module divfreq5Hz(input CLK, output reg CLK_div);
reg[24:0]Count;
always@(posedge CLK) 
 begin
   if(Count>5000000)
	 begin
	  Count<=25'b0;
	  CLK_div <= ~CLK_div;
	 end
	else
		Count<=Count + 1'b1;
 end
endmodule
//7Hz
module divfreq7Hz(input CLK, output reg CLK_div);
reg[24:0]Count;
always@(posedge CLK) 
 begin
   if(Count>3571428)
	 begin
	  Count<=25'b0;
	  CLK_div <= ~CLK_div;
	 end
	else
		Count<=Count + 1'b1;
 end
endmodule
//10Hz
module divfreq10Hz(input CLK, output reg CLK_div);
reg[24:0]Count;
always@(posedge CLK) 
 begin
   if(Count>2500000)
	 begin
	  Count<=25'b0;
	  CLK_div <= ~CLK_div;
	 end
	else
		Count<=Count + 1'b1;
 end
endmodule

//1000Hz
module divfreq1000Hz(input CLK, output reg CLK_div);
reg[24:0]Count = 25'b0;
always@(posedge CLK) 
 begin
   if(Count>25000)
	 begin
	  Count<=25'b0;
	  CLK_div <= ~CLK_div;
	 end
	else
		Count<=Count + 1'b1;
 end
endmodule