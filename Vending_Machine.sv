module Vending_Machine(clk, cancel, select, confirmSel, pb_1, pb_2, balanceLED1, balanceLED2, balanceLED3, changeLED1, changeLED2, dispenseLED);
	
	input clk;
	input pb_1, pb_2;
	input cancel; 
	input [2:0] select; //0, 1, 2, 3, 4, 5, 6, 7
	input confirmSel;
	
	output reg [0:7] balanceLED1, balanceLED2, balanceLED3;
	output reg [0:7] changeLED1, changeLED2;
	output reg [0:6] dispenseLED;
	
	DisplayChange changeDisplayer(change, changeLED1, changeLED2);
	DisplayBalance balanceDisplayer(clk, balance, balanceLED1, balanceLED2, balanceLED3);
	DisplayProduct productDisplayer(product_dispense, dispenseLED);
	
	int selectedNumber = 0;
	int product_dispense = 0;
	int balance = 0; //balance = balanceQ + balanceD
	int balanceQ = 0;
	int balanceD = 0;
	int change = 0;
	int updateBalanceAndChange = 0;
	
	typedef enum {IDLE, DISPENSE} state_type;
	reg current_state, next_state;
	int product_prices[0:6] = '{75, 100, 125, 150, 175, 200, 250};

	always @(posedge pb_1) begin 
		if(cancel || confirmSel) begin
			if(cancel) begin
				balanceQ = 0;
			end else if(confirmSel) begin
				if(balance == 0) begin
					balanceQ = 0;
				end
			end
		end else begin
			if(balance < 250) begin
				balanceQ += 25;
			end
		end
	end
	
	
	always @(posedge pb_2) begin
		if(cancel || confirmSel) begin
			if(cancel) begin
				balanceD = 0;
			end else if(confirmSel) begin
				if(balance == 0) begin
					balanceD = 0;
				end
			end
		end else begin
			if(!(balance + 100 > 250)) begin
				balanceD += 100;
			end
		end
	end
	
	
	always @(posedge clk) begin 
		 balance = balanceD + balanceQ;
		 current_state <= next_state;
		 
		 if(cancel) begin //it is cancel, return all the money back	
			change <= (balance/25); 
			balance <= 0;
		 end else if(confirmSel) begin
			if(balance >= product_prices[selectedNumber-1]) begin
				balance -= product_prices[selectedNumber-1];
				change <= (balance/25);
				balance <= 0;
			end
		 end
	end 
	
	always @(posedge confirmSel) begin
		selectedNumber <= select;
		if(balance >= product_prices[selectedNumber-1]) begin
			product_dispense = selectedNumber;
		end
	end 
	
endmodule