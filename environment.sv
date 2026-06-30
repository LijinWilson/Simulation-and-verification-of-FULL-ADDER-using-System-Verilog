// This environment class contain all the 1) GENERATOR, 2) TRANSACTION 3) DRIVER 4) MONITOR 5) SCORE BOARD.
// Environment Class

// Include all the sub components

`include transaction.sv;
`include generator.sv;
`include driver.sv;
`include monitor.sv;
`include scoreboard.sv;

// environment logic
class environment;
  
//   defining all sub components
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
//   defining the mail box
  mailbox gen2drv;
  mailbox mon2scb;
  
//   defining the interface
  virtual intf vif;
  
//   Defining the constructor
  function new(virtual intf vif);
    this.vif = vif;
    
    gen2drv = new();
    mon2scb = new();
    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);
    scb = new(mon2scb);
    
  endfunction
  
// Main Logic
  task test_run();
    fork // run all component in parallel
      begin
        gen.main();
    	  drv.main();
    	  mon.main();
    	  scb.main();
      end
    join
  endtask
  
endclass
