module division(A,B,result,overflag,underflag);

	input	[31:0]A,B;
	output	[31:0]result;
	output	underflag,overflag;
	
	
//Extract floating-point A and B
	wire	signA,signB,sign_result;
	wire	[7:0]expA,expB,exp_result;
	wire	[23:0]fracA,fracB,frac_result;

	assign	signA=A[31];
	assign	signB=B[31];
	assign	expA=A[30:23];
	assign	expB=B[30:23];
	assign	fracA={1'b1,A[22:0]};
	assign	fracB={1'b1,B[22:0]};

//Local signal 
	wire	[7:0]cpl_expB,temp_exp_result;
	wire	[7:0]exp_result_before_normal;

	wire	[24:0]frac_result_before_normal;

// Caculate sign result
	assign	sign_result = signA ^ signB;

//Additon 2 exponent
	two_compliment8 cplB(.data_in(expB),
						.data_out(cpl_expB));
	adder8 sub_expA_expB(.A(expA),
							.B(cpl_expB),
							.S(temp_exp_result),
							.Cout());
	adder8	add_exp_result_127(.A(temp_exp_result),
								.B(8'd127),
								.S(exp_result_before_normal),
								.Cout());

//Multiplier frac A and frac B
	div	div_two_frac(.A({1'b0,fracA}),
						.B({1'b0,fracB}),
						.result(frac_result_before_normal));

//Normalize the frac answer

	normalize	normalize_ans(.exp_in(exp_result_before_normal),
								.frac_in(frac_result_before_normal),
								.overflag(overflag),
								.underflag(underflag),
								.exp_out(exp_result),
								.frac_out(frac_result));
				    

//Export S
	export_result_div	export_result_value(.A({signA,expA,fracA[22:0]}),
											.B({signB,expB,fracB[22:0]}),
											.temp_result({sign_result,exp_result,frac_result[22:0]}),
											.result(result));
		
endmodule
