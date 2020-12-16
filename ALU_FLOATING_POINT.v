module ALU_FLOATING_POINT(A,B,sel,overflag,underflag,result);
	input	[31:0]A,B;
	input	[1:0]sel;

	output	reg	[31:0]result;
	output	reg	overflag,underflag;

	wire	[31:0]result_add_sub,result_multiplier,result_division;
	wire	over0,over1,over2;
	wire	under0,under1,under2;

	add_sub add_sub(.A(A),
					.B(B),
					.add_or_sub(sel[0]),
					.overflag(over0),
					.underflag(under0),
					.result(result_add_sub));
	multiplier multiplier(.A(A),
							.B(B),
							.overflag(over1),
							.underflag(under1),
							.result(result_multiplier));
	division division(.A(A),
						.B(B),
						.overflag(over2),
						.underflag(under2),
						.result(result_division));


	always@(*)
	begin
		case(sel)
		2'b00, 2'b01: 
			begin 
				result = result_add_sub;
				overflag = over0;
				underflag = under0;
			end
		2'b10: 
			begin 
				result = result_multiplier;
				overflag = over1;
				underflag = under1;
			end
		2'b11: 
			begin 
				result = result_division;
				overflag = over2;
				underflag = under2;
			end
		endcase
	end
endmodule
