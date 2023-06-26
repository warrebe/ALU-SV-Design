module alu(
	input [7:0] in_a,
	input [7:0] in_b,
	input [3:0] opcode,
	output reg [7:0] alu_out,
	output reg alu_zero, // logic '1' when alu_out is all zeros
	output reg alu_carry //indicates a carry out from ALU
);

parameter c_add = 4'h1;
parameter c_sub = 4'h2;
parameter c_inc = 4'h3;
parameter c_dec = 4'h4;
parameter c_or  = 4'h5;
parameter c_and = 4'h6;
parameter c_xor = 4'h7;
parameter c_shr = 4'h8;
parameter c_shl = 4'h9;
parameter c_onescomp = 4'ha;
parameter c_twoscomp = 4'hb;

/* your code here */

always @( opcode, in_a, in_b ) begin
	case ( opcode )
		c_add : alu_out <= add(in_a, in_b);
		c_sub : alu_out <= sub(in_a, in_b);  
		c_inc : alu_out <= inc(in_a);  
		c_dec : alu_out <= dec(in_a);  
		c_or  : alu_out <= or_op(in_a, in_b);  
		c_and : alu_out <= and_op(in_a, in_b);  
		c_xor : alu_out <= xor_op(in_a, in_b);  
		c_shr : alu_out <= shr(in_a);  
		c_shl : alu_out <= shl(in_a);  
		c_onescomp : alu_out <= onecomp(in_a);
		c_twoscomp : alu_out <= twocomp(in_a);
		default : alu_out <= 0;
	endcase
	if (alu_out == 0 && opcode < 4'hb && opcode > 4'h0) begin
		alu_zero <= 1;
	end else begin
		alu_zero <= 0;
	end 
	if ( opcode > 4'h4 && opcode < 4'h9) begin //If op is c_or|c_and|c_xor|shr
		alu_carry <= 0;
	end	
end

function [7:0] add;
	input [7:0] in_a;
	input [7:0] in_b;
	begin
		{alu_carry, add} = in_a + in_b;
	end
endfunction


function [7:0] sub;
	input [7:0] in_a;
	input [7:0] in_b;
	begin
		{alu_carry, sub} = in_a - in_b;
		return sub;
	end
endfunction

function [7:0] inc;
	input [7:0] in_a;
	begin
		inc = in_a + 1;;
		alu_carry = (inc == 0);
		return inc;
	end
endfunction

function [7:0] dec;
	input [7:0] in_a;
	begin
		alu_carry = (in_a == 0); // Carry
		dec = in_a - 1;
	end
endfunction

function [7:0] or_op;
	input [7:0] in_a;
	input [7:0] in_b;
	begin
		or_op = in_a | in_b; // Return value
	end
endfunction

function [7:0] and_op;
	input [7:0] in_a;
	input [7:0] in_b;
	begin
		and_op = in_a & in_b; // Return value
	end
endfunction

function [7:0] xor_op;
	input [7:0] in_a;
	input [7:0] in_b;
	begin
		xor_op = in_a ^ in_b; // Return value
	end
endfunction

function [7:0] shr;
	input [7:0] in_a;
	begin
		shr = in_a >> 1;
		return shr;
	end
endfunction

function [7:0] shl;
	input [7:0] in_a;
	begin
		alu_carry = in_a[7];
		shl = {in_a[6:0], 1'b0};
		return shl;
	end
endfunction

function [7:0] onecomp;
	input [7:0] in_a;
	begin
		{alu_carry, onecomp} = ~in_a; // Return value
	end
endfunction

function [7:0] twocomp;
	input [7:0] in_a;
	begin
		{alu_carry, twocomp} = ~in_a + 1; // Return value
		return twocomp;
	end
endfunction

endmodule
