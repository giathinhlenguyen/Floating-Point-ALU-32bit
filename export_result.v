module export_result_addsub(A,B,temp_result,result);
	input   [31:0]A,B,temp_result;
	output	[31:0]result;
	reg	[31:0]result;

	wire	flagNaNA,flagInfA,flagZeroA,flagNaNB,flagInfB,flagZeroB;

	checkspecial	check_A(.I(A),.flagInf(flagInfA),.flagNaN(flagNaNA),.flagZero(flagZeroA));
	checkspecial	check_B(.I(B),.flagInf(flagInfB),.flagNaN(flagNaNB),.flagZero(flagZeroB));
		
	always@(A or B or temp_result)
	begin
		case ({flagZeroA,flagInfA,flagNaNA,flagZeroB,flagInfB,flagNaNB})
				6'b100_100: result=32'h00000000;
				6'b100_010: result={B[31],31'h7f800000};
				6'b100_001: result=32'h7FFFFFFF;
				6'b100_000: result=B;

				6'b010_100: result=A;
				6'b010_010: result=(B[31]^A[31])?32'h7FFFFFFF:{A[31],31'h7f800000};
				6'b010_001:	result=32'h7FFFFFFF;
				6'b010_000: result={A[31],31'h7f800000};

				6'b001_100, 6'b001_010, 6'b001_001, 6'b001_000:	result=32'h7FFFFFFF;

				6'b000_100: result=A;
				6'b000_010: result={B[31],31'h7f800000};
				6'b000_001:	result=32'h7FFFFFFF;
				6'b000_000:	result=temp_result;	
		endcase
	end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////

module export_result_mult(A,B,temp_result,result);
	input   [31:0]A,B,temp_result;
	output	[31:0]result;
	reg	[31:0]result;

	wire	flagNaNA,flagInfA,flagZeroA,flagNaNB,flagInfB,flagZeroB;

	checkspecial	check_A(.I(A),.flagInf(flagInfA),.flagNaN(flagNaNA),.flagZero(flagZeroA));
	checkspecial	check_B(.I(B),.flagInf(flagInfB),.flagNaN(flagNaNB),.flagZero(flagZeroB));

	always@(A or B or temp_result)
		begin
			case ({flagZeroA,flagInfA,flagNaNA,flagZeroB,flagInfB,flagNaNB})
				6'b100_100: result=32'h00000000;
				6'b100_010: result=32'h7FFFFFFF;
				6'b100_001: result=32'h7FFFFFFF;
				6'b100_000: result=32'h00000000;

				6'b010_100: result=32'h7FFFFFFF;
				6'b010_010: result={temp_result[31],31'h7f800000};	
				6'b010_001:	result=32'h7FFFFFFF;
				6'b010_000: result={temp_result[31],31'h7f800000};

				6'b001_100, 6'b001_010, 6'b001_001, 6'b001_000:	result=32'h7FFFFFFF;

				6'b000_100: result=32'h00000000;
				6'b000_010: result={temp_result[31],31'h7f800000};
				6'b000_001:	result=32'h7FFFFFFF;
				6'b000_000:	result=temp_result;		
				
			endcase
		end
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

module export_result_div(A,B,temp_result,result);
	input   [31:0]A,B,temp_result;
	output	[31:0]result;
	reg	[31:0]result;

	wire	flagNaNA,flagInfA,flagZeroA,flagNaNB,flagInfB,flagZeroB;

	checkspecial	check_A(.I(A),.flagInf(flagInfA),.flagNaN(flagNaNA),.flagZero(flagZeroA));
	checkspecial	check_B(.I(B),.flagInf(flagInfB),.flagNaN(flagNaNB),.flagZero(flagZeroB));
		
	always@(A or B or temp_result)
		begin
			case ({flagZeroA,flagInfA,flagNaNA,flagZeroB,flagInfB,flagNaNB})
				6'b100_100: result=32'h7FFFFFFF;
				6'b100_010: result=32'h00000000;
				6'b100_001: result=32'h7FFFFFFF;
				6'b100_000: result=32'h00000000;

				6'b010_100: result={temp_result[31],31'h7f800000};
				6'b010_010: result=32'h7FFFFFFF;	
				6'b010_001:	result=32'h7FFFFFFF;
				6'b010_000: result={temp_result[31],31'h7f800000};

				6'b001_100, 6'b001_010, 6'b001_001, 6'b001_000:	result=32'h7FFFFFFF;

				6'b000_100: result={temp_result[31],31'h7f800000};
				6'b000_010: result=32'h00000000;
				6'b000_001:	result=32'h7FFFFFFF;
				6'b000_000:	result=temp_result;	
			endcase
		end

endmodule
