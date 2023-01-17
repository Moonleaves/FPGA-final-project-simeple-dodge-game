# FPGA-final-project-simeple-dodge-game 
### Author: 107321057

#### Input/Output unit:<br>
* 8x8 LED 矩陣，用來顯示遊戲畫面。下圖為按下 gameIsStart 的初始畫面。<br>
<img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/IMG_9091.jpeg" width="300"/><br>
* LED 陣列，用來計分。<br>
<img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/IMG_9093.jpeg" width="300"/><br>

#### 功能說明:<br>
藍點是玩家，可左右移動，移動的越多分數就越高，若碰到掉落的紅點就會轉移到end game 遊戲畫面，隨時都可以重新開始遊戲<br>

#### 程式模組說明:<br>
module dodgeDemo(output reg[7:0] DATA_R//紅色燈, DATA_G//綠色燈, DATA_B//藍色燈, USER_SCORE//計分,<br>
					output reg[3:0] COMM,//控制亮燈排數<br>
					input CLK, gameIsStart//遊戲開始結束鍵, left//玩家往左, right//玩家往右);<br><br>
*** 說明各 I/O 變數接到哪個 FPGA I/O 裝置<br>
玩家左右移動的按鍵接到輕觸式開關 <br>
遊戲開始的鍵接到switch <br>
*** 加強說明程式邏輯 <br>
parameter logic [7:0] END_Chars [7:0] //結束畫面 <br>
logic [7:0] user_move [7:0]//使用者移動的畫面 assign給藍燈<br>
logic [7:0] enemys_drop [7:0]//紅點掉落的畫面 assign給紅燈<br><br>
紅點掉落以及使用者移動 皆使用微修改的8bit shift register實現，分別是drop_8bit和move_8bit<br>
init變數控制每一次遊戲重新開始時，所需要的初始化，所以需要傳入drop_8bit和move_8bit<br><br>
//將8排的紅點輸出都從drop_8bit函數取出來，並接到enemys_drop(紅點掉落的畫面)，drop為1則開始掉落（shift），0則暫停掉落(shift)<br>
//drop_8bit 掉落速度為10Hz, drop_8bit2 掉落速度為1Hz<br>
	logic [7:0] enemys_drop [7:0] =<br>
			'{8'b11111111,<br>
			8'b11111111,<br>
			8'b11111111,<br>
			8'b11111111,<br>
			8'b11111111,<br>
			8'b11111111,<br>
			8'b11111111,<br>
			8'b11111111};<br>
	drop_8bit E1(enemys_drop[0], CLK, drop[0], init);<br>
	drop_8bit E2(enemys_drop[1], CLK, drop[1], init);<br>
	drop_8bit E3(enemys_drop[2], CLK, drop[2], init);<br>
	drop_8bit E4(enemys_drop[3], CLK, drop[3], init);<br>
	drop_8bit2 E5(enemys_drop[4], CLK, drop[4], init);<br>
	drop_8bit E6(enemys_drop[5], CLK, drop[5], init);<br>
	drop_8bit2 E7(enemys_drop[6], CLK, drop[6], init);<br>
	drop_8bit2 E8(enemys_drop[7], CLK, drop[7], init);<br><br>

	 always @(posedge CLK_div5) begin//如果使用者是正在移動，則分數增加
		if(!init) USER_SCORE <= 8'b0;
		else if(left && user[7] && !gameIsEnd)
		USER_SCORE <= USER_SCORE + 1;
		else if(right && user[0] && !gameIsEnd)
		USER_SCORE <= USER_SCORE + 1;
	 end
	 
	 drop <= Count%256;//因為drop是8bit，每一個bit分別控制每一排是否掉落紅點，只要assign給drop一個隨機的數字就可以實現隨機掉落
	 always @(posedge CLK) begin//隨機數字所需要的時間計數
		Count<=Count + 1'b1;
	 end
	 
	 //detect collision偵測碰撞，當紅燈和藍燈同時亮燈的時候，遊戲結束
	for(int idx = 0;idx < 8; idx = idx + 1) begin
		gameIsEnd <= !DATA_B[idx] && !DATA_R[idx];
	end
#### Demo video: 

<a href="https://drive.google.com/drive/folders/1vax_kr09RbKgWnHvMoZwPw7NJVomISRL?usp=sharing" title="Demo Video"><img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/3027E902-0B3E-421C-B9CF-CE19174C01CE_1_102_o.jpeg" alt="Demo Video" width="500"/></a>
