module mult24(A,B,S);
	input	[23:0]A,B;
	output	[47:0]S;

	wire	[23:0]stage11,stage12,stage13,stage14;
	wire	[23:0]stage2;
	wire	stage2_c;
	wire	[23:0]stage31,stage32;

	//Stage1
	mult12	block1(A[11:0],B[11:0],stage11);
	mult12	block2(A[11:0],B[23:12],stage12);
	mult12	block3(A[23:12],B[11:0],stage13);
	mult12	block4(A[23:12],B[23:12],stage14);

	//Stage2
	adder24  block5(.A(stage12),.B(stage13),.S(stage2),.Cout(stage2_c));

	//Stage3
	adder24	block6(.A({{12{1'b0}},stage11[23:12]}),.B(stage2),.S(stage31),.Cout());
	adder24	block7(.A(stage14),.B({{11{1'b0}},stage2_c,stage31[23:12]}),.S(stage32),.Cout());

	assign	S = {stage32,stage31[11:0],stage11[11:0]};

endmodule
///////////////////////////////////////////////////////////////////////////////////////////ok
module mult12(A,B,S);	
	input	[11:0]A,B;
	output	[23:0]S;

	wire	[11:0]stage11,stage12,stage13,stage14;
	wire	[11:0]stage2;
	wire	stage2_c;
	wire	[11:0]stage31,stage32;

	//Stage1
	mult6	block1(A[5:0],B[5:0],stage11);
	mult6	block2(A[5:0],B[11:6],stage12);
	mult6	block3(A[11:6],B[5:0],stage13);
	mult6	block4(A[11:6],B[11:6],stage14);

	//Stage2
	adder12  block5(.A(stage12),.B(stage13),.S(stage2),.Cout(stage2_c));

	//Stage3
	adder12	block6(.A({{6{1'b0}},stage11[11:6]}),.B(stage2),.S(stage31),.Cout());
	adder12	block7(.A(stage14),.B({{5{1'b0}},stage2_c,stage31[11:6]}),.S(stage32),.Cout());

	assign	S = {stage32,stage31[5:0],stage11[5:0]};
endmodule

///////////////////////////////////////////////////////////////////////////////////ok
module mult6(A,B,S);
	input	[5:0]A,B;
	output	[11:0]S;

	wire	[5:0]stage11,stage12,stage13,stage14;
	wire	[5:0]stage2;
	wire	stage2_c;
	wire	[5:0]stage31,stage32;

//Stage1
	mult3	block1(A[2:0],B[2:0],stage11);
	mult3	block2(A[2:0],B[5:3],stage12);
	mult3	block3(A[5:3],B[2:0],stage13);
	mult3	block4(A[5:3],B[5:3],stage14);

//Stage2
	adder6  block5(.A(stage12),.B(stage13),.S(stage2),.Cout(stage2_c));

//Stage3
	adder6	block6(.A({3'b000,stage11[5:3]}),.B(stage2),.S(stage31),.Cout());
	adder6	block7(.A(stage14),.B({2'b00,stage2_c,stage31[5:3]}),.S(stage32),.Cout());

	assign	S = {stage32,stage31[2:0],stage11[2:0]};
endmodule

////////////////////////////////////////////////////////////////////////////////ok
module mult3(A,B,S);
	input [2:0] A;
	input [2:0] B;
	output [5:0] S;

	wire [2:0] P0, P1, P2;
	wire c0, c1, c2, c3, c4, s1, s2;

// stage 1
	assign P0[2] = A[2] & B[0];
	assign P0[1] = A[1] & B[0];
	assign P0[0] = A[0] & B[0];

// stage 2
	assign P1[2] = A[2] & B[1];
	assign P1[1] = A[1] & B[1];
	assign P1[0] = A[0] & B[1];

// stage 3
	assign P2[2] = A[2] & B[2];
	assign P2[1] = A[1] & B[2];
	assign P2[0] = A[0] & B[2];

// Add all stages
	assign S[0] = P0[0];
	FA  block1(.a(P0[1]),.b(P1[0]),.cin(0),.s(S[1]),.cout(c0));
	FA  block2(.a(P0[2]),.b(P1[1]),.cin(P2[0]),.s(s1),.cout(c1));
	FA  block3(.a(c0),.b(s1),.cin(0),.s(S[2]),.cout(c2));
	FA  block4(.a(P2[1]),.b(P1[2]),.cin(c1),.s(s2),.cout(c3));
	FA  block5(.a(c2),.b(s2),.cin(0),.s(S[3]),.cout(c4));
	FA  block6(.a(c4),.b(P2[2]),.cin(c3),.s(S[4]),.cout(S[5]));
endmodule

////////////////////////////////////////////////////////////////////ok
module FA(a,b,cin,s,cout);
	input a,b,cin;
	output s,cout;

	wire g,p,c1;

	and(g,a,b);
	xor(p,a,b);
	xor(s,p,cin);

	and(c1,p,cin);
	or(cout,c1,g);
endmodule
