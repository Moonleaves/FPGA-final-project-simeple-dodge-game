# FPGA-final-project-simeple-dodge-game 
### Authors: 107321057

#### Input/Output unit:<br>
* 8x8 LED 矩陣，用來顯示對戰畫面。下圖為按下 clear 的初始畫面。<br>
<img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/IMG_9091.jpeg" width="300"/><br>
* LED 陣列，用來計分。<br>
<img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/IMG_9093.jpeg" width="300"/><br>

#### 功能說明:<br>
紅色與藍色玩家對戰，先贏五球 或 在時間結束後最高分者獲勝。<br>

#### 程式模組說明:<br>
module slide_game(output reg[3:0]S //控制亮燈排數,output reg [7:0]Red //紅色燈,output reg [7:0]Green //綠色燈,
output reg [7:0]Blue //藍色燈,output reg [4:0]A_count,B_count //計分,output [6:0]O //倒計時,output reg beep //叫聲,input [1:0]button //玩家一左右,input [1:0]button2 //玩家二左右,input CLk,Clear); <br><br>
*** 請說明各 I/O 變數接到哪個 FPGA I/O 裝置，例如: button, button2 -> 接到 4-bit SW <br>
*** 請加強說明程式邏輯 <br>

#### Demo video: 

<a href="https://drive.google.com/drive/folders/1vax_kr09RbKgWnHvMoZwPw7NJVomISRL?usp=sharing" title="Demo Video"><img src="https://github.com/Moonleaves/FPGA-final-project-simeple-dodge-game/blob/main/images/3027E902-0B3E-421C-B9CF-CE19174C01CE_1_102_o.jpeg" alt="Demo Video" width="500"/></a>
