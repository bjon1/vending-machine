module DisplayProduct(product_dispense, dispenseLED);

input [2:0] product_dispense; //user can choose from 1-7, hence 3 bits.
output [0:6] dispenseLED;

	//display the product 
	always @(product_dispense) begin
		 // Use a case statement to map the binary input to the appropriate
		 // signal for each segment in the display.
		 case (product_dispense)
				
			  0: begin
					dispenseLED = 7'b0000000;
			  end
			  1: begin
					dispenseLED = 7'b0000001;
			  end
			  2: begin
					dispenseLED = 7'b0000010;
			  end
			  3: begin
					dispenseLED = 7'b0000100;
			  end
			  4: begin
					dispenseLED = 7'b0001000;
			  end
			  5: begin
					dispenseLED = 7'b0010000;
			  end
			  6: begin
					dispenseLED = 7'b0100000;
			  end
			  7: begin
					dispenseLED = 7'b1000000;
			  end
			  default: begin
					dispenseLED = 7'b1111111;
			  end
		 endcase
	end
endmodule