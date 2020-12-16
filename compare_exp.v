module compare_exp(A,B,numbershift,sign);
	input  [7:0]A;
	input  [7:0]B;

	output [4:0]numbershift;
	output sign;
	
	wire   [8:0]tempA,tempB,cpl_tempB;

	wire   [7:0] exp_temp;
	wire   [7:0] cpl_exp_temp,temp_shift;

	wire	checknumbershift;

	assign  tempA={1'b0,A};
	assign  tempB={1'b0,B};

	two_compliment9 cpl9(.data_in(tempB),.data_out(cpl_tempB));
	adder9  addA_extB(.A(tempA),.B(cpl_tempB),.S({sign,exp_temp}),.Cout());
	two_compliment8 cpl8(.data_in(exp_temp),.data_out(cpl_exp_temp));

	assign temp_shift=sign?cpl_exp_temp:exp_temp;
		//checknumbershift = 1 if temp_shift>=24
	assign checknumbershift=temp_shift[7]|temp_shift[6]|temp_shift[5]|(~temp_shift[7]&~temp_shift[6]&temp_shift[5]&temp_shift[4]);//?????????
	assign numbershift=checknumbershift?5'd0:temp_shift[4:0];
endmodule
