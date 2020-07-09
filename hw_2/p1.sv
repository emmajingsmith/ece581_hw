/*
 * Name: Emma Smith
 * Date: 22 July 2020
 * Description: Small testbench to prove the initilization values of a
 *               variable and logic net. 
 *
*/

module p1;

  var logic a;
  logic b;
  initial begin
    #50;

    a = 0;
    b = 0;

    #10 $finish;
  end
endmodule;
