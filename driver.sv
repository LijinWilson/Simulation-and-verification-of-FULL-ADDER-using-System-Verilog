// DRIVER CLASS
/*
  -  Interface is an static component/type and this class is an dynamic component.
  -  Inorder to use a static component inside the dynamic component, we need to define the interface name as an dyanmic keyword.
*/

// DRIVER CLASS: take the information from the MAIL BOX and transfer to the DUT via INTERFACE.
		
class driver;

//   Since interface is static type, class in dynamic type. making the interface dynamic.
  virtual intf vif;
  
  mailbox gen2drv;
  
//   Constructor
  function new(virtual intf vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
//   DRIVER logic: Take the info from the mail box and pass it to the interface
  task main();
    repeat(2) // generator also repeat twice
      begin
       transaction trans;
    
//     Getting the value from the mail box to the driver
    	gen2drv.get(trans);
    
    	vif.a = trans.a;
    	vif.b = trans.b;
    	vif.c = trans.c;
        #1;
        
        trans.display("Driver Class Signals");
      end
    
  endtask
endclass
