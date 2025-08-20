module a_l_u_8
(
    input enable,
    input [7:0] opA, opB,
    input [3:0] sel,
    output reg [7:0] result,
    output reg carry
);

    // Inline arithmetic/logical operations
    wire [8:0] sum_res   = opA + opB;        // 9-bit to capture carry
    wire [8:0] diff_res  = {1'b0, opA} - opB;
    wire [8:0] inc_res   = opA + 1'b1;
    wire [8:0] dec_res   = opA - 1'b1;

    wire [7:0] and_res   = opA & opB;
    wire [7:0] or_res    = opA | opB;
    wire [7:0] xor_res   = opA ^ opB;
    wire [7:0] not_res   = ~opA;

    always @(*) begin
        if (sel[3] == 1) begin
            // Arithmetic operations
            case (sel[2:0])
                3'b111: begin
                    result = sum_res[7:0];
                    carry  = sum_res[8];
                end
                3'b110: begin
                    result = diff_res[7:0];
                    carry  = diff_res[8];  // borrow bit
                end
                3'b101: begin
                    result = inc_res[7:0];
                    carry  = inc_res[8];
                end
                3'b100: begin
                    result = dec_res[7:0];
                    carry  = dec_res[8];  // borrow
                end
                default: begin
                    result = 8'b00000000;
                    carry  = 1'b0;
                end
            endcase
        end
        else begin
            // Logical operations
            carry = 1'b0;
            case (sel[2:0])
                3'b111: result = and_res;
                3'b110: result = or_res;
                3'b101: result = xor_res;
                3'b100: result = not_res;
                default: result = 8'b00000000;
            endcase
        end
    end

endmodule
