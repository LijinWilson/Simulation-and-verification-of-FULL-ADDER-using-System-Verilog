/*
    -  To declare all the signal present inside the DUT that will communicate with the interface.
    -  We need to give all this as an packet to the generator.
    -  the input signal are mentioned using the rand keyword which need to give some value as input to DUT
*/

// Transaction Class: Just to declare all the signal of the interface/DUT

//Transaction class : just declare all the signals of interface/dut 
class transaction; // packet class
  rand bit a;
  rand bit b;
  rand bit c;
  
	   bit sum;  //outputs so dont randomize
  	   bit carry;
  
  //Display function to get a, b , sum , carry in all classes
  
  function void display (string name);// just a display function to cal from all TB Components and Display values
    $display("__________ %s _________", name);
    $display("a = %0b, b=%0b, c=%0b,  sum = %0b, carry = %0b", a,b,c,sum,carry);
    $display(".......................");
    
  endfunction
  
endclass

  
