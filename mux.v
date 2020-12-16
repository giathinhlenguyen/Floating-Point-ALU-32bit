module mux24b(A,B,sel,out);
	input  [23:0]A,B;
	input  sel;
	output [23:0]out;
	
	assign out=sel?A:B;
endmodule
//////////////////////////////////////////////////////////////////////////////////

module mux8b(A,B,sel,out);
	input  [7:0]A,B;
	input  sel;
	output [7:0]out;
	
	assign out=sel?A:B;
endmodule
////////////////////////////////////////////////////////////////////////////////

module mux1b(A,B,sel,out);
	input  A,B;
	input  sel;
	output out;
	
	assign out=sel?A:B;
endmodule