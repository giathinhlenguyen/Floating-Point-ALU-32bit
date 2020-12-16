module adder3(A,B,S,Cout);
// Port in declarations
	input [2:0]A;
	input [2:0]B;
// Port out declarations
	output [2:0]S;
	output	Cout;
//Local signal declarations
	wire   [2:0]g,p;
	wire   [2:0]c;

//Preprocessing
	assign g = A&B;
	assign p = A^B;  
//Processing
	clb3    clb3(.gin(g),
				.pin(p),
				.cin(1'b0),
				.gout(Cout),
				.pout(),
				.cout(c));
//Postprocessing  
	assign S = p^c;
endmodule
///////////////////////////////////////////////////////////////////////////////

module adder6(A,B,S,Cout);
// Port in declarations
	input  [5:0]A;
	input  [5:0]B;
// Port out declarations
	output [5:0]S;
	output	Cout;
//Local signal declarations	
	wire   [5:0]g,p;
	wire   [5:0]c;

	wire   [1:0]g_stage1;
	wire   [1:0]p_stage1;
	wire   [1:0]c_stage2;
//Preprocessing   
	assign g = A&B;
	assign p = A^B;
//Processing
	clb    clb(.gin(g[3:0]),
				.pin(p[3:0]),
				.cin(c_stage2[0]),
				.gout(g_stage1[0]),
				.pout(p_stage1[0]),
				.cout(c[3:0]));

	clb2    clb2_1(.gin(g[5:4]),
				.pin(p[5:4]),
				.cin(c_stage2[1]),
				.gout(g_stage1[1]),
				.pout(p_stage1[1]),
				.cout(c[5:4]));

	clb2    clb2_2(.gin(g_stage1),
				.pin(p_stage1),
				.cin(1'b0),
				.gout(Cout),
				.pout(),
				.cout(c_stage2));
//Postprocessing  
	assign S = p^c;
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////

module adder8(A,B,S,Cout);
// Port in declarations
	input  [7:0]A;
	input  [7:0]B;
// Port out declarations
	output [7:0]S;
	output	Cout;
//Local signal declarations	
	wire   [7:0]g,p;
	wire   [7:0]c;

	wire   [1:0]g_stage1;
	wire   [1:0]p_stage1;
	wire   [1:0]c_stage2;
//Preprocessing   
	assign g = A&B;
	assign p = A^B;
//Processing
	clb    clb_1(.gin(g[3:0]),
				.pin(p[3:0]),
				.cin(c_stage2[0]),
				.gout(g_stage1[0]),
				.pout(p_stage1[0]),
				.cout(c[3:0]));

	clb    clb_2(.gin(g[7:4]),
				.pin(p[7:4]),
				.cin(c_stage2[1]),
				.gout(g_stage1[1]),
				.pout(p_stage1[1]),
				.cout(c[7:4]));

	clb2    clb2(.gin(g_stage1),
				.pin(p_stage1),
				.cin(1'b0),
				.gout(Cout),
				.pout(),
				.cout(c_stage2));
//Postprocessing  
	assign S = p^c;
endmodule
///////////////////////////////////////////////////////////////////////////////////

module adder9(A,B,S,Cout);
// Port in declarations
	input  [8:0]A;
	input  [8:0]B;
// Port out declarations
	output [8:0]S;
	output	Cout;
//Local signal declarations	
	wire   [8:0]g,p;
	wire   [8:0]c;

	wire   [1:0]g_stage1;
	wire   [1:0]p_stage1;
	wire   [1:0]c_stage2;
//Preprocessing   
	assign g = A&B;
	assign p = A^B;
//Processing
	clb    clb_1(.gin(g[3:0]),
				.pin(p[3:0]),
				.cin(c_stage2[0]),
				.gout(g_stage1[0]),
				.pout(p_stage1[0]),
				.cout(c[3:0]));

	clb    clb_2(.gin(g[7:4]),
				.pin(p[7:4]),
				.cin(c_stage2[1]),
				.gout(g_stage1[1]),
				.pout(p_stage1[1]),
				.cout(c[7:4]));

	clb3    clb(.gin({g[8],g_stage1}),
				.pin({p[8],p_stage1}),
				.cin(1'b0),
				.gout(Cout),
				.pout(),
				.cout({c[8],c_stage2}));
//Postprocessing  
	assign S = p^c;
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////

module adder10(A,B,S,Cout);
// Port in declarations
	input  [9:0]A;
	input  [9:0]B;
// Port out declarations
	output [9:0]S;
	output	Cout;
//Local signal declarations	
	wire   [9:0]g,p;
	wire   [9:0]c;

	wire   [2:0]g_stage1;
	wire   [2:0]p_stage1;
	wire   [2:0]c_stage2;
//Preprocessing   
	assign g = A&B;
	assign p = A^B;
//Processing
	clb    clb_1(.gin(g[3:0]),
				.pin(p[3:0]),
				.cin(c_stage2[0]),
				.gout(g_stage1[0]),
				.pout(p_stage1[0]),
				.cout(c[3:0]));

	clb    clb_2(.gin(g[7:4]),
				.pin(p[7:4]),
				.cin(c_stage2[1]),
				.gout(g_stage1[1]),
				.pout(p_stage1[1]),
				.cout(c[7:4]));

	clb2    clb2(.gin(g[9:8]),
				.pin(p[9:8]),
				.cin(c_stage2[2]),
				.gout(g_stage1[2]),
				.pout(p_stage1[2]),
				.cout(c[9:8]));

	clb3    clb3(.gin(g_stage1),
				.pin(p_stage1),
				.cin(1'b0),
				.gout(Cout),
				.pout(),
				.cout(c_stage2));

//Postprocessing  
	assign S = p^c;
endmodule
/////////////////////////////////////////////////////////////////////////////////////////

module adder12(A,B,S,Cout);
// Port in declarations
	input  [11:0]A;
	input  [11:0]B;
// Port out declarations
	output [11:0]S;
	output	Cout;
//Local signal declarations	
	wire   [11:0]g,p;
	wire   [11:0]c;

	wire   [2:0]g_stage1;
	wire   [2:0]p_stage1;
	wire   [2:0]c_stage2;
//Preprocessing   
	assign g = A&B;
	assign p = A^B;
//Processing
	clb    clb_1(.gin(g[3:0]),
				.pin(p[3:0]),
				.cin(c_stage2[0]),
				.gout(g_stage1[0]),
				.pout(p_stage1[0]),
				.cout(c[3:0]));

	clb    clb_2(.gin(g[7:4]),
				.pin(p[7:4]),
				.cin(c_stage2[1]),
				.gout(g_stage1[1]),
				.pout(p_stage1[1]),
				.cout(c[7:4]));

	clb    clb_3(.gin(g[11:8]),
				.pin(p[11:8]),
				.cin(c_stage2[2]),
				.gout(g_stage1[2]),
				.pout(p_stage1[2]),
				.cout(c[11:8]));

	clb3    clb3(.gin(g_stage1),
				.pin(p_stage1),
				.cin(1'b0),
				.gout(Cout),
				.pout(),
				.cout(c_stage2));

//Postprocessing  
	assign S = p^c;
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////

module adder24(A,B,S,Cout);
//Port in declarations
	input [23:0]A;
	input [23:0]B;
//Port out declarations
	output [23:0]S;
	output Cout;
//Local signal declarations
	wire [23:0] g,p;
	wire [23:0] c;

	wire [5:0] g_stage1, p_stage1, c_stage2;
	wire [1:0] g_stage2, p_stage2, c_stage3;
//Preprocessing
	assign g = A&B;
	assign p = A^B;
//Processing
	clb clb_1(g[3:0],p[3:0],c_stage2[0],g_stage1[0],p_stage1[0],c[3:0]);
	clb clb_2(g[7:4],p[7:4],c_stage2[1],g_stage1[1],p_stage1[1],c[7:4]);
	clb clb_3(g[11:8],p[11:8],c_stage2[2],g_stage1[2],p_stage1[2],c[11:8]);
	clb clb_4(g[15:12],p[15:12],c_stage2[3],g_stage1[3],p_stage1[3],c[15:12]);
	clb clb_5(g[19:16],p[19:16],c_stage2[4],g_stage1[4],p_stage1[4],c[19:16]);
	clb clb_6(g[23:20],p[23:20],c_stage2[5],g_stage1[5],p_stage1[5],c[23:20]);

	clb clb_7(g_stage1[3:0],p_stage1[3:0],c_stage3[0],g_stage2[0],p_stage2[0],c_stage2[3:0]);
	clb2 clb2_1(g_stage1[5:4],p_stage1[5:4],c_stage3[1],g_stage2[1],p_stage2[1],c_stage2[5:4]);

	clb2 clb2_2(g_stage2,p_stage2,1'b0,Cout,,c_stage3);
//Postprocessing
	assign S = p^c;
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////

module adder25(A,B,S,Cout);
//Port in declarations
	input [24:0]A;
	input [24:0]B;
//Port out declarations
	output [24:0]S;
	output Cout;
//Local signal declarations
	wire [24:0] g,p;
	wire [24:0] c;

	wire [5:0] g_stage1, p_stage1, c_stage2;
	wire [1:0] g_stage2, p_stage2, c_stage3;
//Preprocessing
	assign g = A&B;
	assign p = A^B;
//Processing
	clb clb_1(g[3:0],p[3:0],c_stage2[0],g_stage1[0],p_stage1[0],c[3:0]);
	clb clb_2(g[7:4],p[7:4],c_stage2[1],g_stage1[1],p_stage1[1],c[7:4]);
	clb clb_3(g[11:8],p[11:8],c_stage2[2],g_stage1[2],p_stage1[2],c[11:8]);
	clb clb_4(g[15:12],p[15:12],c_stage2[3],g_stage1[3],p_stage1[3],c[15:12]);
	clb clb_5(g[19:16],p[19:16],c_stage2[4],g_stage1[4],p_stage1[4],c[19:16]);
	clb clb_6(g[23:20],p[23:20],c_stage2[5],g_stage1[5],p_stage1[5],c[23:20]);

	clb clb_7(g_stage1[3:0],p_stage1[3:0],c_stage3[0],g_stage2[0],p_stage2[0],c_stage2[3:0]);
	clb3 clb3({g[24],g_stage1[5:4]},{p[24],p_stage1[5:4]},c_stage3[1],g_stage2[1],p_stage2[1],{c[24],c_stage2[5:4]});

	clb2 clb2_2(g_stage2,p_stage2,1'b0,Cout,,c_stage3);
//Postprocessing
	assign S = p^c;
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module adder26(A,B,S,Cout);
//Port in declarations
	input [25:0]A;
	input [25:0]B;
//Port out declarations
	output [25:0]S;
	output Cout;
//Local signal declarations
	wire [25:0] g,p;
	wire [25:0] c;

	wire [6:0] g_stage1, p_stage1, c_stage2;
	wire [1:0] g_stage2, p_stage2, c_stage3;
//Preprocessing
	assign g = A&B;
	assign p = A^B;
//Processing
	clb clb_1(g[3:0],p[3:0],c_stage2[0],g_stage1[0],p_stage1[0],c[3:0]);
	clb clb_2(g[7:4],p[7:4],c_stage2[1],g_stage1[1],p_stage1[1],c[7:4]);
	clb clb_3(g[11:8],p[11:8],c_stage2[2],g_stage1[2],p_stage1[2],c[11:8]);
	clb clb_4(g[15:12],p[15:12],c_stage2[3],g_stage1[3],p_stage1[3],c[15:12]);
	clb clb_5(g[19:16],p[19:16],c_stage2[4],g_stage1[4],p_stage1[4],c[19:16]);
	clb clb_6(g[23:20],p[23:20],c_stage2[5],g_stage1[5],p_stage1[5],c[23:20]);
	clb2 clb2_1(g[25:24],p[25:24],c_stage2[6],g_stage1[6],p_stage1[6],c[25:24]);

	clb clb_7(g_stage1[3:0],p_stage1[3:0],c_stage3[0],g_stage2[0],p_stage2[0],c_stage2[3:0]);
	clb3 clb3_1(g_stage1[6:4],p_stage1[6:4],c_stage3[1],g_stage2[1],p_stage2[1],c_stage2[6:4]);

	clb2 clb2_2(g_stage2,p_stage2,1'b0,Cout,,c_stage3);
//Postprocessing
	assign S = p^c;
endmodule