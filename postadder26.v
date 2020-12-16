module postadder26(data_in,sign,frac);
	input	[25:0]data_in;
	output	sign;
	output	[24:0]frac;

	wire	[24:0]temp,cpltemp;

	assign	sign=data_in[25];	
	assign 	temp=data_in[24:0];
	two_compliment25	cplfrac(.data_in(temp),.data_out(cpltemp));
	assign	frac=sign?cpltemp:temp;
endmodule
