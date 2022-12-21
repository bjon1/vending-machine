module DisplayChange(change, changeLED1, changeLED2);

input [3:0] change; //3 bits, highest value is 10
output [0:7] changeLED1, changeLED2; 


//display change
	always @(change) begin
		 // Use a case statement to map the binary input to the appropriate
		 // signal for each segment in the display.
		 case (change)
		 
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
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b00000011;
			  end
			  1: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b10011111;
			  end
			  2: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b00100101;
			  end
			  3: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b00001101;
			  end
			  4: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b10011001;
			  end
			  5: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b01001001; 
			  end
			  6: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b01000001;
			  end
			  7: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b00011111;
			  end
			  8: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b00000001;
			  end
			  9: begin
					changeLED1 = 8'b00000011;
					changeLED2 = 8'b00001001;
			  end
			  10: begin
					changeLED1 = 8'b10011111;
					changeLED2 = 8'b00000011;
			  end
			  default: begin
					changeLED1 = 8'b11111101; 
					changeLED2 = 8'b11111101; 
			  end
		 endcase
	end
endmodule