module add_sub(A,B,add_or_sub,overflag,underflag,result);
// Port in declarations
	input	[31:0]A,B;
	input	add_or_sub;
// Port out declarations
	output	underflag,overflag;
	output	[31:0]result;
//Extract floating-point A and B
	wire	signA,signB,sign_result;
	wire	[7:0]expA,expB,exp_result;
	wire	[23:0]fracA,fracB,frac_result;

	assign	signA=A[31];
	assign	signB=B[31]^add_or_sub;
	assign	expA=A[30:23];
	assign	expB=B[30:23];
	assign	fracA={1'b1,A[22:0]};
	assign	fracB={1'b1,B[22:0]};

//Local signal declarations
	wire	expA_vs_expB; //ok

	wire	[7:0]exp_before_normal;

	wire	[23:0]frac_before_shift,frac_after_shift,frac_not_shift;
	wire	[4:0]shift_right_by_n; //ok

	wire	sign_shift,sign_not_shift;//ok

	wire	[25:0]after_add,before_add_1,before_add_2;//ok

	wire	[24:0]frac_before_normal;  //ok
/////////////////////////////////////////////////////////////////////////////////////////////////////
//Compare and choose exponent A and B 
//expA_LT_expB=1 => expA <  expB
//expA_LT_expB=0 => expA >= expB
	compare_exp	compare_expAB(.A(expA),.B(expB),.numbershift(shift_right_by_n),.sign(expA_vs_expB));
	mux8b		choose_exp(.A(expB),.B(expA),.sel(expA_vs_expB),.out(exp_before_normal));


//Shift and add frac A to B
//Choose and shift frac
//expA_LT_expB=1 => expA <  expB => shift frac A
//expA_LT_expB=0 => expA >= expB => shift frac 
	mux24b		not_shift(.A(fracB),.B(fracA),.sel(expA_vs_expB),.out(frac_not_shift));	
	mux24b		shift_right(.A(fracA),.B(fracB),.sel(expA_vs_expB),.out(frac_before_shift));
	shiftright	shift_right24b(.data_in(frac_before_shift),.sel(shift_right_by_n),.data_out(frac_after_shift));


//Choose sign for 2 frac
	mux1b		choose_sign_shift(.A(signA),.B(signB),.sel(expA_vs_expB),.out(sign_shift));
	mux1b		choose_sign_not_shift(.A(signB),.B(signA),.sel(expA_vs_expB),.out(sign_not_shift));

//Add 2 frac
	preadder26      preproccess_add(.sign1(sign_shift),.sign2(sign_not_shift),
	                            .in1(frac_after_shift),.in2(frac_not_shift),.full1(before_add_1),.full2(before_add_2));
	adder26		process_add(.A(before_add_1),.B(before_add_2),.S(after_add),.Cout());
	postadder26	postprocess_add(.data_in(after_add),.sign(sign_result),.frac(frac_before_normal));

//Normalize the frac answer
	normalize	normalize_ans(.exp_in(exp_before_normal),.frac_in(frac_before_normal),
								.overflag(overflag),.underflag(underflag),.exp_out(exp_result),.frac_out(frac_result));

//Export S
	export_result_addsub	export_result_addsub(.A({signA,expA,fracA[22:0]}),.B({signB,expB,fracB[22:0]}),
												.temp_result({sign_result,exp_result,frac_result[22:0]}),.result(result));
		
endmodule
