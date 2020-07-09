/*
 * Name: Emma Smith
 * Date: 8 July 2020
 * Description: Testbench for both the or gate and multiplexer modules
 *
*/

`timescale 1ns/100ps
module testbench;

  localparam  data_width = 8;
  localparam  num_inputs = 4;
  localparam  period = 20;

  logic [num_inputs - 1: 0] or_input = 0;
  logic [(num_inputs >> 1)- 1: 0] select = 0;

  logic [data_width - 1: 0] mux_input [num_inputs - 1 : 0];
  logic or_output;
  logic [data_width - 1: 0] mux_output;


  or_gate #(.NUM_INPUTS(num_inputs)) or_ut (.inputs(or_input), .out(or_output));
  mux #(.WIDTH(data_width), .NUM_INPUTS(num_inputs)) mux_ut (.data(mux_input), .out(mux_output), .select (select));


  initial begin
    // Initializing mux input values
    // Assigning individualy because assigning in a
    // batch causes compiler error (fatal: 11)
    mux_input[0] = 8'h3a;
    mux_input[1] = 8'h6b;
    mux_input[2] = 8'hf3;
    mux_input[3] = 8'h45;

    // Test or_gate module
    // Test all or inputs false. Expect false.
    or_input = 0;
    #period;

    // Test all inputs true. Expect true.
    or_input = 4'hff;
    #period;

    // Expect true for all
    or_input = 4'h1;
    #period;
    for (int i = 0; i < num_inputs - 1; i = i + 1) begin
      or_input = or_input * 2;
      #period;
    end

    // Test Multiplexer
    // Check each mux input
    for (int i = 0; i < num_inputs; i = i + 1) begin
      select = i;
      #period;
    end
    #period $finish;
  end
 endmodule
