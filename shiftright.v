module shiftright(data_in,sel,data_out);	
	input   [23:0]data_in;
	input   [4:0]sel;
	output	[23:0]data_out;

	wire	[23:0]temp1,temp2,temp3,temp4;

	shiftrightby16	stage4(.data_in(data_in),.sel(sel[4]),.data_out(temp4));
	shiftrightby8	stage3(.data_in(temp4),.sel(sel[3]),.data_out(temp3));
	shiftrightby4	stage2(.data_in(temp3),.sel(sel[2]),.data_out(temp2));
	shiftrightby2	stage1(.data_in(temp2),.sel(sel[1]),.data_out(temp1));
	shiftrightby1	stage0(.data_in(temp1),.sel(sel[0]),.data_out(data_out));
endmodule
////////////////////////////////////////////////////////////////////////////

module shiftrightby1(data_in,sel,data_out);	
	input   [23:0]data_in;
	input   sel;
	output	[23:0]data_out;

	assign data_out = sel?{1'b0,data_in[23:1]}:data_in;
endmodule
///////////////////////////////////////////////////////////////////////////
module shiftrightby2(data_in,sel,data_out);	
	input   [23:0]data_in;
	input   sel;
	output	[23:0]data_out;

	assign data_out = sel?{2'b00,data_in[23:2]}:data_in;
endmodule
///////////////////////////////////////////////////////////////////////////

module shiftrightby4(data_in,sel,data_out);	
	input   [23:0]data_in;
	input   sel;
	output	[23:0]data_out;

	assign data_out = sel?{4'b0000,data_in[23:4]}:data_in;
endmodule
//////////////////////////////////////////////////////////////////////////

module shiftrightby8(data_in,sel,data_out);
	input   [23:0]data_in;
	input   sel;
	output	[23:0]data_out;

	assign data_out = sel?{8'h00,data_in[23:8]}:data_in;
endmodule
////////////////////////////////////////////////////////////////////////

module shiftrightby16(data_in,sel,data_out);
	input   [23:0]data_in;
	input   sel;
	output	[23:0]data_out;

	assign data_out = sel?{16'h0000,data_in[23:16]}:data_in;
endmodule
