
module dodgeDemo(output reg[7:0] DATA_R, DATA_G, DATA_B, USER_SCORE,//the longer you live, the more you score.
					output reg[3:0] COMM,
					input CLK, gameIsStart, left, right);
					//9 'clock direction
	//when game is ending to show
	parameter logic [7:0] END_Chars [7:0] =
			 '{8'b00100000,
				8'b10101011,
				8'b10100011,
				8'b00011111,
				8'b11111111,
				8'b01010111,
				8'b01010111,
				8'b00000111};

// show user move screen
	logic [7:0] user_move [7:0] =
			'{8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111};
			
// show enemy droping screen
	logic [7:0] enemys_drop [7:0] =
			'{8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111,
			8'b11111111};
			
			
	bit[24:0]Count = 25'b0;
	bit init;
	bit[7:0] drop = 8'b0;
	bit gameIsEnd = 0;
	bit [2:0] cnt;
	bit [7:0] user;
	divfreq5Hz F3(CLK, CLK_div5);
	divfreq1000Hz F0(CLK, CLK_div);
	divfreq1Hz F1(CLK, CLK_div1);
	move_8bit F2(user, CLK, left, right, init);
	drop_8bit E1(enemys_drop[0], CLK, drop[0], init);
	drop_8bit E2(enemys_drop[1], CLK, drop[1], init);
	drop_8bit E3(enemys_drop[2], CLK, drop[2], init);
	drop_8bit E4(enemys_drop[3], CLK, drop[3], init);
	drop_8bit2 E5(enemys_drop[4], CLK, drop[4], init);
	drop_8bit E6(enemys_drop[5], CLK, drop[5], init);
	drop_8bit2 E7(enemys_drop[6], CLK, drop[6], init);
	drop_8bit2 E8(enemys_drop[7], CLK, drop[7], init);
	//move function output assignment
	assign user_move[0][7] = user[7];
	assign user_move[1][7] = user[6];
	assign user_move[2][7] = user[5];
	assign user_move[3][7] = user[4];
	assign user_move[4][7] = user[3];
	assign user_move[5][7] = user[2];
	assign user_move[6][7] = user[1];
	assign user_move[7][7] = user[0];
	
	initial begin
	  Count <= 25'b0;
	  cnt <= 0;
	  DATA_R <= 8'b11111111;
	  DATA_G <= 8'b11111111;
	  DATA_B <= 8'b11111111;
	  COMM <= 4'b1000;
	  init <= 0;
	  drop <= 8'b0;
	  gameIsEnd <= 0;
	end
	 always @(posedge CLK_div)begin
		 if(gameIsStart) begin
				if(!gameIsEnd) begin
				 if(!init) begin
				  cnt <= 0;
				  DATA_R <= 8'b11111111;
				  DATA_G <= 8'b11111111;
				  DATA_B <= 8'b11111111;
				  COMM <= 4'b1000;
				  init <= 1;
				  drop <= 8'b0;
				  gameIsEnd <= 1'b0;
				 end
				 /////////////////////////////////////////////////Game is Start
				 if(cnt>=7)
						cnt <= 0;
				 else
						cnt <= cnt +1;
				 COMM <= {1'b1,cnt};
					drop <= Count%256;//random drop
				  //show screen
				  DATA_B <= user_move[cnt];
				  DATA_R <= enemys_drop[cnt];
				  //detect collision
				  for(int idx = 0;idx < 8; idx = idx + 1) begin
					gameIsEnd <= !DATA_B[idx] && !DATA_R[idx];
				  end
				  
				end
			   //////////////////////////////////////////////////game is end
				else begin
				  if(cnt>=7)
						cnt <= 0;
				  else
						cnt <= cnt +1;
				  COMM <= {1'b1,cnt};//show screen ,green and red change in every second
				  if(CLK_div1) begin//red
					DATA_R <= END_Chars[cnt];
					DATA_G <= 8'b11111111;
					DATA_B <= 8'b11111111;
				  end
				  else begin//green
					DATA_R <= 8'b11111111;
					DATA_G <= END_Chars[cnt];
					DATA_B <= 8'b11111111;
				  end
				end
		 end
		 else begin//screen is all black
		  DATA_R <= 8'b11111111;
		  DATA_G <= 8'b11111111;
		  DATA_B <= 8'b11111111;
		  COMM <= 4'b1000;
		  gameIsEnd <= 0;// prepare to next new Game
		  init <= 0;//prepare to next new Game
		 end
	 end
	 always @(posedge CLK_div5) begin//if user is moving, add user's score
		if(!init) USER_SCORE <= 8'b0;
		else if(left && user[7] && !gameIsEnd)
		USER_SCORE <= USER_SCORE + 1;
		else if(right && user[0] && !gameIsEnd)
		USER_SCORE <= USER_SCORE + 1;
	 end
	 always @(posedge CLK) begin
			Count<=Count + 1'b1;
	 end
	 
endmodule
