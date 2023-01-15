# FPGA-final-project-simeple-dodge-game 
### Authors: 107321057

#### Input/Output unit:<br>
* 8x8 LED 矩陣，用來顯示遊戲畫面。下圖為按下 gameIsStart 的初始畫面。<br>
<img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/IMG_9091.jpeg" width="300"/><br>
* LED 陣列，用來計分。<br>
<img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/IMG_9093.jpeg" width="300"/><br>

#### 功能說明:<br>
藍點是玩家，可左右移動，移動的越多分數就越高，若碰到掉落的紅點就會轉移到end game 遊戲畫面，隨時都可以重新開始遊戲<br>

#### 程式模組說明:<br>
module slide_game(output reg[3:0]S //控制亮燈排數,output reg [7:0]Red //紅色燈,output reg [7:0]Green //綠色燈,
output reg [7:0]Blue //藍色燈,output reg [4:0]A_count,B_count //計分,output [6:0]O //倒計時,output reg beep //叫聲,input [1:0]button //玩家一左右,input [1:0]button2 //玩家二左右,input CLk,Clear); <br><br>
*** 說明各 I/O 變數接到哪個 FPGA I/O 裝置，例如: button, button2 -> 接到 4-bit SW <br>
玩家左右移動的按鍵接到輕觸式開關
遊戲開始的鍵接到switch
*** 加強說明程式邏輯 <br>


#### Demo video: 

<a href="https://drive.google.com/drive/folders/1vax_kr09RbKgWnHvMoZwPw7NJVomISRL?usp=sharing" title="Demo Video"><img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/3027E902-0B3E-421C-B9CF-CE19174C01CE_1_102_o.jpeg" alt="Demo Video" width="500"/></a>
