module testbench();
//   test bench contain 3 module test, interface and DUT
  
  // Interface
  intf intff();
  
//   Test
  // we are passing the interface handle inside the test
  test tst(intff);
  
//   DUT
  full_adder fa1(
    .sum(intff.sum),
    .carry(intff.carry),
    .a(intff.a),
    .b(intff.b),
    .c(intff.c)
  );
  
//   Output wave generation
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  
endmodule
