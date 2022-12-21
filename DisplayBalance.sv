module DisplayBalance (clk, balance, balanceLED1, balanceLED2, balanceLED3);
	input clk;
	input[7:0] balance;
   output [0:7] balanceLED1, balanceLED2, balanceLED3;

	// This always block will be executed whenever there is a change in the
	// balance signal.
	//display balance
	always @(posedge clk) begin
	 
		 // Use a case statement to map the binary input to the appropriate
		 // signal for each segment in the display.
		 case (balance)
			  	//8'b11111100 0
				//8'b01100000 1
				//8'b11011010 2
				//8'b11110010 3
				//8'b01100110 4
				//8'b10110110 5
				//8'b10111110 6
				//8'b11100000 7
				//8'b11111110 8
				//8'b11110110 9
			  0: begin
					balanceLED1 = 8'b00000010; //0.
					balanceLED2 = 8'b00000011; //0
					balanceLED3 = 8'b00000011; //0
			  end
			  25: begin
					balanceLED1 = 8'b00000010; //0.
					balanceLED2 = 8'b00100101; //2
					balanceLED3 = 8'b01001001; //5
			  end
			  50: begin
					balanceLED1 = 8'b00000010; //0.
					balanceLED2 = 8'b01001001; //5
					balanceLED3 = 8'b00000011; //0
			  end
			  75: begin
					balanceLED1 = 8'b00000010; //0.
					balanceLED2 = 8'b00011111; //7
					balanceLED3 = 8'b01001001; //5
			  end
			  100: begin
					balanceLED1 = 8'b10011110; //1.
					balanceLED2 = 8'b00000011; //0
					balanceLED3 = 8'b00000011; //0
			  end
			  125: begin
					balanceLED1 = 8'b10011110; //1.
					balanceLED2 = 8'b00100101; //2
					balanceLED3 = 8'b01001001; //5
			  end
			  150: begin
					balanceLED1 = 8'b10011110; //1.
					balanceLED2 = 8'b01001001; //5
					balanceLED3 = 8'b00000011; //0
			  end
			  175: begin
					balanceLED1 = 8'b10011110; //1.
					balanceLED2 = 8'b00011111; //7
					balanceLED3 = 8'b01001001; //5
			  end
			  200: begin
					balanceLED1 = 8'b00100100; //2.
					balanceLED2 = 8'b00000011; //0
					balanceLED3 = 8'b00000011; //0
			  end
			  225: begin
					balanceLED1 = 8'b00100100; //2.
					balanceLED2 = 8'b00100101; //2
					balanceLED3 = 8'b01001001; //5
			  end
			  250: begin
					balanceLED1 = 8'b00100100; //2.
					balanceLED2 = 8'b01001001; //5
					balanceLED3 = 8'b00000011; //0
			  end
			  default: begin
					balanceLED1 = 8'b11111101; //-
					balanceLED2 = 8'b11111101; //-
					balanceLED3 = 8'b11111101; //-
			  end
		 endcase
	end
endmodule