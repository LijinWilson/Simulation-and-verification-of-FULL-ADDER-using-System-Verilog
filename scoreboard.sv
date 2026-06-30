/*
  -  It will collect the data/packet using the MAIL BOX from MONITOR.
  -  It will check whatever output sending from the DUT through monitor are correct or not.
  
*/

class scoreboard;

//   MAIL BOX to collect the data from the DUT to monitor
// Typed mailbox.
// Without #(transaction), the compiler uses the default mailbox(object)
// and may issue a mailbox specialization warning.
// Mailbox for transaction transfer between Generator and Driver.

mailbox #(transaction) gen2drv;
mailbox #(transaction) mon2scb;
  
//   Constructor
  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
//   scoreboard logic
  task main();
    transaction trans;
    
    repeat(2)
      begin
//         Getting the value stores inside the mail box
        mon2scb.get(trans);
        trans.display("Score Board Signals");
        
//         Validation cases/logic
        if(((trans.a ^ trans.b ^ trans.c) == trans.sum) && (((trans.a & trans.b)|(trans.b & trans.c) | (trans.a & trans.c)) == trans.carry))
          begin
            $display("**************** PASS ****************");
          end
        else
          begin
            $display("**************** FAIL ****************");
          end
        $display("///////////////////// TRANSACTION DONE /////////////////////");
      end
  endtask
  
endclass
