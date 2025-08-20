`timescale 1ns/1ps

module tb_alu8_custom();

    reg [7:0] inA;
    reg [7:0] inB;
    reg enable;
    reg [3:0] sel;
    wire carry;
    wire [7:0] result;

    localparam clk_period = 20;

    // DUT instantiation
    a_l_u_8 uut (
        .opA(inA),
        .opB(inB),
        .carry(carry),
        .enable(enable),
        .sel(sel),
        .result(result)
    );

    initial begin
        // VCD for waveform dumping
        $dumpfile("alu8_custom.vcd");
        $dumpvars(0, tb_alu8_custom);

        // Initial values
        inA = 8'b00000000;  
        inB = 8'b00000000;
        enable = 1'b0;
        sel = 4'b0000;

        #clk_period;

        // ADD
        #5 enable = 1'b1;
        #1 sel = 4'b1111;  
        inA = 8'b11111111;
        inB = 8'b00000001;
        #2 enable = 1'b0;

        #clk_period;

        // OR
        #5 enable = 1'b1;
        #1 sel = 4'b0110;  
        inA = 8'b11001100;
        inB = 8'b00110011;
        #2 enable = 1'b0;
        
        #clk_period;
        
        // NOT
        #5 enable = 1'b1;
        #1 sel = 4'b0100;  
        inA = 8'b10101010;
        #2 enable = 1'b0;
        
        #clk_period;
        
        // SUBTRACT
        #5 enable = 1'b1;
        #1 sel = 4'b1110;  
        inA = 8'b00000000;
        inB = 8'b00000001;
        #2 enable = 1'b0;
        
        #clk_period;
        
        // AND
        #5 enable = 1'b1;
        #1 sel = 4'b0111;  
        inA = 8'b11001100;
        inB = 8'b00110011;
        #2 enable = 1'b0;
        
        #clk_period;

        $finish;  // end simulation
    end

endmodule
