`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Victor Oliveira 

//////////////////////////////////////////////////////////////////////////////////


module mux_8_to_1(  input logic [2:0] slct,
                    input logic [255:0] data_in,
                    output logic [31:0] data_out

    );
    
    always_comb begin                                   // Selects which 32-bit word will be output
        case(slct)                                      // based on Address' 3 offset bits
            3'h0:       data_out = data_in[255:224];
            3'h1:       data_out = data_in[223:192];
            3'h2:       data_out = data_in[191:160];
            3'h3:       data_out = data_in[159:128];
            3'h4:       data_out = data_in[127:96];
            3'h5:       data_out = data_in[95:64];
            3'h6:       data_out = data_in[63:32];
            3'h7:       data_out = data_in[31:0];
            default:    data_out = data_in[255:224];
        endcase
    end
        
endmodule
