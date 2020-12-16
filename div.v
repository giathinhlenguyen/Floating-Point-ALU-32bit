module div(A,B,result);

	input	[24:0]A,B;
	output	[24:0]result;

	wire 	[24:0]cplB;
	wire	[24:0]A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25;
	wire	[24:0]B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25;
	wire	[24:0]temp_result0,temp_result1,temp_result2,temp_result3,temp_result4,temp_result5,temp_result6,temp_result7,
					temp_result8,temp_result9,temp_result10,temp_result11,temp_result12,temp_result13,temp_result14,temp_result15,
					temp_result16,temp_result17,temp_result18,temp_result19,temp_result20,temp_result21,temp_result22,temp_result23,
					temp_result24,temp_result25;

	//Compliment of B 
	two_compliment25 cpl(.data_in(B),.data_out(cplB));
		
	//Stage 25
	assign temp_result25 ={A[0],{24{1'b0}}};
	assign A25 = {1'b0,A[24:1]};
	assign B25 = A[24]?B:cplB;
	adder25 stage25( .S ( A24 ) ,.A( {A25[23:0],temp_result25[24]} ),.B( B25 ) );

	//Stage24
	assign temp_result24[24:1] = temp_result25[23:0];
	assign temp_result24[0] = A24[24]?0:1;
	assign B24 = A24[24]?B:cplB;
	adder25 stage24( .S ( A23 ) ,.A( {A24[23:0],temp_result24[24]} ),.B( B24 ) );

	//Stage23
	assign temp_result23[24:1] = temp_result24[23:0];
	assign temp_result23[0] = A23[24]?0:1;
	assign B23 = A23[24]?B:cplB;
	adder25 stage23( .S ( A22 ) ,.A( {A23[23:0],temp_result23[24]} ),.B( B23 ) );

	//Stage22
	assign temp_result22[24:1] = temp_result23[23:0];
	assign temp_result22[0] = A22[24]?0:1;
	assign B22 = A22[24]?B:cplB;
	adder25 stage22( .S ( A21 ) ,.A( {A22[23:0],temp_result22[24]} ),.B( B22 ) );

	//Stage21
	assign temp_result21[24:1] = temp_result22[23:0];
	assign temp_result21[0] = A21[24]?0:1;
	assign B21 = A21[24]?B:cplB;
	adder25 stage21( .S ( A20 ) ,.A( {A21[23:0],temp_result21[24]} ),.B( B21 ) );

	//Stage20
	assign temp_result20[24:1] = temp_result21[23:0];
	assign temp_result20[0] = A20[24]?0:1;
	assign B20 = A20[24]?B:cplB;
	adder25 stage20( .S ( A19 ) ,.A( {A20[23:0],temp_result20[24]} ),.B( B20 ) );

	//Stage19
	assign temp_result19[24:1] = temp_result20[23:0];
	assign temp_result19[0] = A19[24]?0:1;
	assign B19 = A19[24]?B:cplB;
	adder25 stage19( .S ( A18 ) ,.A( {A19[23:0],temp_result19[24]} ),.B( B19 ) );

	//Stage18
	assign temp_result18[24:1] = temp_result19[23:0];
	assign temp_result18[0] = A18[24]?0:1;
	assign B18 = A18[24]?B:cplB;
	adder25 stage18( .S ( A17 ) ,.A( {A18[23:0],temp_result18[24]} ),.B( B18 ) );

	//Stage17
	assign temp_result17[24:1] = temp_result18[23:0];
	assign temp_result17[0] = A17[24]?0:1;
	assign B17 = A17[24]?B:cplB;
	adder25 stage17( .S ( A16 ) ,.A( {A17[23:0],temp_result17[24]} ),.B( B17 ) );

	//Stage16
	assign temp_result16[24:1] = temp_result17[23:0];
	assign temp_result16[0] = A16[24]?0:1;
	assign B16 = A16[24]?B:cplB;
	adder25 stage16( .S ( A15 ) ,.A( {A16[23:0],temp_result16[24]} ),.B( B16 ) );

	//Stage15
	assign temp_result15[24:1] = temp_result16[23:0];
	assign temp_result15[0] = A15[24]?0:1;
	assign B15 = A15[24]?B:cplB;
	adder25 stage15( .S ( A14 ) ,.A( {A15[23:0],temp_result15[24]} ),.B( B15 ) );

	//Stage14
	assign temp_result14[24:1] = temp_result15[23:0];
	assign temp_result14[0] = A14[24]?0:1;
	assign B14 = A14[24]?B:cplB;
	adder25 stage14( .S ( A13 ) ,.A( {A14[23:0],temp_result14[24]} ),.B( B14 ) );

	//Stage13
	assign temp_result13[24:1] = temp_result14[23:0];
	assign temp_result13[0] = A13[24]?0:1;
	assign B13 = A13[24]?B:cplB;
	adder25 stage13( .S ( A12 ) ,.A( {A13[23:0],temp_result13[24]} ),.B( B13 ) );

	//Stage12
	assign temp_result12[24:1] = temp_result13[23:0];
	assign temp_result12[0] = A12[24]?0:1;
	assign B12 = A12[24]?B:cplB;
	adder25 stage12( .S ( A11 ) ,.A( {A12[23:0],temp_result12[24]} ),.B( B12 ) );

	//Stage11
	assign temp_result11[24:1] = temp_result12[23:0];
	assign temp_result11[0] = A11[24]?0:1;
	assign B11 = A11[24]?B:cplB;
	adder25 stage11( .S ( A10 ) ,.A( {A11[23:0],temp_result11[24]} ),.B( B11 ) );

	//Stage10
	assign temp_result10[24:1] = temp_result11[23:0];
	assign temp_result10[0] = A10[24]?0:1;
	assign B10 = A10[24]?B:cplB;
	adder25 stage10( .S ( A9 ) ,.A( {A10[23:0],temp_result10[24]} ),.B( B10 ) );

	//Stage9
	assign temp_result9[24:1] = temp_result10[23:0];
	assign temp_result9[0] = A9[24]?0:1;
	assign B9 = A9[24]?B:cplB;
	adder25 stage9( .S ( A8 ) ,.A( {A9[23:0],temp_result9[24]} ),.B( B9 ) );

	//Stage8
	assign temp_result8[24:1] = temp_result9[23:0];
	assign temp_result8[0] = A8[24]?0:1;
	assign B8 = A8[24]?B:cplB;
	adder25 stage8( .S ( A7 ) ,.A( {A8[23:0],temp_result8[24]} ),.B( B8 ) );

	//Stage7
	assign temp_result7[24:1] = temp_result8[23:0];
	assign temp_result7[0] = A7[24]?0:1;
	assign B7 = A7[24]?B:cplB;
	adder25 stage7( .S ( A6 ) ,.A( {A7[23:0],temp_result7[24]} ),.B( B7 ) );

	//Stage6
	assign temp_result6[24:1] = temp_result7[23:0];
	assign temp_result6[0] = A6[24]?0:1;
	assign B6 = A6[24]?B:cplB;
	adder25 stage6( .S ( A5 ) ,.A( {A6[23:0],temp_result6[24]} ),.B( B6 ) );

	//Stage5
	assign temp_result5[24:1] = temp_result6[23:0];
	assign temp_result5[0] = A5[24]?0:1;
	assign B5 = A5[24]?B:cplB;
	adder25 stage5( .S ( A4 ) ,.A( {A5[23:0],temp_result5[24]} ),.B( B5 ) );

	//Stage4
	assign temp_result4[24:1] = temp_result5[23:0];
	assign temp_result4[0] = A4[24]?0:1;
	assign B4 = A4[24]?B:cplB;
	adder25 stage4( .S ( A3 ) ,.A( {A4[23:0],temp_result4[24]} ),.B( B4 ) );

	//Stage3
	assign temp_result3[24:1] = temp_result4[23:0];
	assign temp_result3[0] = A3[24]?0:1;
	assign B3 = A3[24]?B:cplB;
	adder25 stage3( .S ( A2 ) ,.A( {A3[23:0],temp_result3[24]} ),.B( B3 ) );

	//Stage2
	assign temp_result2[24:1] = temp_result3[23:0];
	assign temp_result2[0] = A2[24]?0:1;
	assign B2 = A2[24]?B:cplB;
	adder25 stage2( .S ( A1 ) ,.A( {A2[23:0],temp_result2[24]} ),.B( B2 ) );

	//Stage1
	assign temp_result1[24:1] = temp_result2[23:0];
	assign temp_result1[0] = A1[24]?0:1;
	assign B1 = A1[24]?B:cplB;
	adder25 stage1( .S ( A0 ) ,.A( {A1[23:0],temp_result1[24]} ),.B( B1 ) );

	//Stage0
	assign temp_result0[24:1] = temp_result1[23:0];
	assign temp_result0[0] = A0[24]?0:1;

	assign result = {1'b0,temp_result0[24:1]};
endmodule
