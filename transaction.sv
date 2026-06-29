/*
    -  To declare all the signal present inside the DUT that will communicate with the interface.
    -  We need to give all this as an packet to the generator.
    -  the input signal are mentioned using the rand keyword which need to give some value as input to DUT
*/

// Transaction Class: Just to declare all the signal of the interface/DUT

class transaction; // Packet Class
  rand bit a;
  rand bit b;
  rand bit c;
  
  bit sum;
  bit carry;
endclass

// Display function to get the values of a, b, c, sum, carry in all classes
// Just a display function to call from all TB component and display values.

function display(string name);
  $display("%s", name);
  $display("a = %0b | b = %0b | c = %0b | sum = %0b | carry = %0b", a, b, c, sum, carry);
endfunction
