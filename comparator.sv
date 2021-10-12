`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Victor Oliveira 

//////////////////////////////////////////////////////////////////////////////////


module comparator   #(parameter INPUT_SIZE = 4)
                    (   input logic op,
                        input logic [INPUT_SIZE-1:0] in_0, in_1,
                        output logic comp_out
    );
    
    always_comb begin                       // Comparator does 2 operations:
        if (op) begin                       // Less than comparison outputs 1 if 
            comp_out = (in_1 < in_0);       // second input is less than first, otherwise outputs 0
        end else begin                      // Equality comparison outputs 1 if
            comp_out = (in_1 == in_0);      // both inputs have the same value, otherwise outputs 0
        end
    end
                                            
endmodule
