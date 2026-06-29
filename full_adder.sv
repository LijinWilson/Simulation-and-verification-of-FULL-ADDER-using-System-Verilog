// Code your design here
module full_adder(sum, carry, a, b, c);
  input a, b, c;
  output sum, carry;
  
  wire c1, c2, c3;
  
//   SUM
  xor x1(sum, a, b, c);
  
//   CARRY
  and a1(c1, a, b);
  and a2(c2, a, c);
  and a3(c3, b, c);
  
  or(carry, c1, c2, c3);
  
endmodule
