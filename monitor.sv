// Monitor Class: It will take the value from the interface coming from DUT and sending to scoreboard

class monitor;
  virtual intf vif;
  
//   MAILBOX for communication between the monitor and scoreboard

//   defining the mail box
// Mailbox for transaction transfer between Generator and Driver.
// Typed mailbox.
// Without #(transaction), the compiler uses the default mailbox(object)
// and may issue a mailbox specialization warning.
//   WARNING VCP2947
// Default parameter values used for class std::mailbox specialization.
//   mailbox #(transaction) mon2scb;
  
//   Constructor
  function new(virtual intf vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
//   MONITOR LOGIC
  task main();
    repeat(2)
      #1; // give 1 time delay to sample the data
    begin
      transaction trans;
      trans = new();	// creating the object of the transaction class
      
      // Sampling
      trans.a = vif.a;
      trans.b = vif.b;
      trans.c = vif.c;
      trans.sum = vif.sum;
      trans.carry = vif.carry;
      
//       Putting all the value inside the mail box
      mon2scb.put(trans);
      
//       Displaying all the value inserted
      trans.display("Monitor Class Signals");
    end
  endtask
  
endclass
