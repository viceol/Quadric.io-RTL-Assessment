`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Victor Oliveira 

//////////////////////////////////////////////////////////////////////////////////


module test;

    logic op, out1, out2;
    logic [31:0] a, b;
    logic [1:0] out3;
    logic [31:0] c, d;
    
//    comparator #(.INPUT_SIZE(32)) comp1 (.op(op), .in_1(a), .in_2(b), .comp_out(out1));
//    comparator #(.INPUT_SIZE(32)) comp2 (.op(op), .in_1(b), .in_2(a), .comp_out(out2));

    rep_pol_comb rep_dec (.line_0(a), .line_1(b), .line_2(c), .line_3(d), .rplc(out3));
    
//    initial begin
//        a = 256;
//        b = 72;
//        op = 0;
//        #10;
//        $display("a == b? ", out1);
//        op = 1;
//        #1;
//        $display("a < b? ", out1);
//        $display("b < a? ", out2);
//        op = 0;
//        a = 72;
//        #1;
//        $display("a == b? ", out1);
//        op = 1;
//        #1;
//        $display("a < b? ", out1);
//        $display("b < a? ", out2);
//        op = 0;
//        a = 24;
//        #1;
//        $display("a == b? ", out1);
//        op = 1;
//        #1;
//        $display("a < b? ", out1);
//        $display("b < a? ", out2);
//        $finish;
//    end

    initial begin
        a = 3;
        b = 5;
        c = 8;
        d = 2;
        #10;
        $display("line with lowest value MSW is line %d", out3);
        d = 3;
        #1;
        $display("line with lowest value MSW is line %d", out3);
        a = 6;
        #1;
        $display("line with lowest value MSW is line %d", out3);
        d = 7;
        #1;
        $display("line with lowest value MSW is line %d", out3);
        $finish;
    end

endmodule
