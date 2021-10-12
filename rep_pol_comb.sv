`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Victor Oliveira 

//////////////////////////////////////////////////////////////////////////////////


module rep_pol_comb(    input logic [31:0] line_0,
                        input logic [31:0] line_1,
                        input logic [31:0] line_2,
                        input logic [31:0] line_3,
                        output logic [1:0] rplc

    );
    
    localparam op = 1'b1;           // Only care about less than operation
    
    logic lt_0, lt_1, lt_2;         // Keep track of which lines had the lowest value
    logic [31:0] low_0, low_1;      // Keep track of which values were lowest
    
    comparator #(.INPUT_SIZE(32)) comp0 (   .op(op),            // Comparator to find lowest value
                                            .in_0(line_0),      // MSW between way 0 and way 1
                                            .in_1(line_1), 
                                            .comp_out(lt_0));
                                            
    comparator #(.INPUT_SIZE(32)) comp1 (   .op(op),            // Comparator to find lowest value
                                            .in_0(line_2),      // MSW between way 2 and way 3
                                            .in_1(line_3), 
                                            .comp_out(lt_1));
                                               
    comparator #(.INPUT_SIZE(32)) comp2 (   .op(op),            // Comparator to find lowest value 
                                            .in_0(low_0),       // MSW overall
                                            .in_1(low_1), 
                                            .comp_out(lt_2));
    
    always_comb begin
        low_0 = lt_0 ? line_1 : line_0;                 // Send lower value MSW between way 0 and way 1 to next comparator
        low_1 = lt_1 ? line_3 : line_2;                 // Send lower value MSW between way 2 and way 3 to next comparator
        rplc = lt_2 ? 2'b10 + lt_1 : 2'b00 + lt_0;      // Calculate index of way with lowest value MSW
    end                                                 // and output it, any ties will output way with lower index
    
endmodule
