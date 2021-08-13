// Implements a circuit that can display characters on a 7-segment display. 
// inputs: SW1-0 selects the letter to display. The characters are:
// SW 1 0 Char
// ----------------
// 0 0 'd'
// 0 1 'E'
// 1 0 '2'
// 1 1 ' 'blank
// outputs: LEDR1-0 show the states of the switches
//          HEX0 displays the selected character
module tutorial (SW, LEDR, HEX0);
	input [1:0] SW; // toggle switches
	output [17:0] LEDR; // red LEDs
	output [0:6] HEX0; // 7-seg display
	
	wire [1:0] C;
	
	assign LEDR[1:0] = SW;
	assign LEDR[17:2] = 16'b0;
	
	assign C = SW;
/*
*   0 
*  --- 
*  | |
* 5| |1
*  |6|
*  --- 
*  | |
* 4| |2
*  | |
*  --- 
*   3 
*/
// the following equations describe HEX0[0-6] in SOP form
	assign HEX0[0] = ~((~C[1] & C[0]) | (C[1] & ~C[0])); 
	assign HEX0[1] = C[0];
	assign HEX0[2] = C[0] | C[1];
	assign HEX0[3] = C[0] & C[1];
	assign HEX0[4] = C[0] & C[1];
	assign HEX0[5] = ~(~C[1] & C[0]); 
	assign HEX0[6] = C[0] & C[1];
endmodule