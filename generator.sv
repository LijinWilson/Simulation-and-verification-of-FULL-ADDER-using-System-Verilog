// Generator Class
/*
  -  Generator has to generate different set of data(transaction). 
  -  Generator will generate the transaction(data) and send too the monitor.
      -  So it contain the TRANSACTION and MAIL BOX.
  -  
  -  
*/

// Generator Class: Randomize transaction signal and send it to the driver class through mail box

class generator;
  transaction trans;
  
//   MAIL BOX between the generator class and driver.
//   defining the mail box
// Mailbox for transaction transfer between Generator and Driver.
// Typed mailbox.
// Without #(transaction), the compiler uses the default mailbox(object)
// and may issue a mailbox specialization warning.
  mailbox #(transaction) gen2drv;
  
//   CONSTRUCTOR
//   When we call the constructor, it will create memory for generator class and allocate memory for variable and initialize with default values.
  function new (mailbox #(transaction) gen2drv);
    begin
      this.gen2drv = gen2drv;
    end
  endfunction
    
//     TASK to generate the random values and put it inside th transaction class and to display and put those value inside the mail box
    
    task main();
        repeat(2)
          begin
//             Creating object of transaction class
            trans = new();
            
//             randmozing the rand variable inside the transaction class
            trans.randomize();
            
//             Displaying those value inside the transaction class
            trans.display("Generator class variables");
            
//             Putting those values inside the MAIL BOX
            gen2drv.put(trans);
            
          end
    endtask
  
endclass
