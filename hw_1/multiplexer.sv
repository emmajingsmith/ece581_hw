/*
 * Name: Emma Smith
 * Date: 8 July 2020
 * Description: OR function with parameratizeable input.
 *              Separate signals can be conccatinated to the
 *              "inputs" signal.
 *              Default is two inputs.
 *
*/
module or_gate
# (parameter  NUM_INPUTS = 2)
(
  input [NUM_INPUTS - 1: 0] inputs,
  output logic         out
 );
  /* If the inputs are anything other than 0, output is a 1 */
  assign out = inputs ? 1 : 0;

endmodule
