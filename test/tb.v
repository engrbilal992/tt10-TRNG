`default_nettype none

`timescale 1ns / 1ps

<<<<<<< HEAD


=======
>>>>>>> 50cd743 (add trng design)
module tb ();



  // Dump the signals to a VCD file. You can view it with gtkwave or surfer.

  initial begin

    $dumpfile("tb.vcd");

    $dumpvars(0, tb);
<<<<<<< HEAD

=======
>>>>>>> 50cd743 (add trng design)
  end



  // Wire up the inputs and outputs:

  reg clk;

  reg rst_n;

  reg ena;

  reg [7:0] ui_in;

  reg [7:0] uio_in;

  wire [7:0] uo_out;

  wire [7:0] uio_out;

  wire [7:0] uio_oe;

<<<<<<< HEAD


  `ifdef GL_TEST

=======
  `ifdef GL_TEST
>>>>>>> 50cd743 (add trng design)
  wire VPWR = 1'b1;

  wire VGND = 1'b0;
<<<<<<< HEAD

  `endif



  // Clock process

  always #5 clk = ~clk;  // 100MHz clock



  // Initial block to set reset and input values

  initial begin

    clk   = 0;

    rst_n = 0;

    ena   = 0;

    ui_in = 0;

    uio_in = 0;

    #20;          // Hold reset for 20ns

    rst_n = 1;    // Release reset

  end



  // Debugging Monitor

  initial begin

    $monitor("Time: %0t | rst_n: %b | ena: %b | ui_in: %h | uio_in: %h | uo_out: %h", 

             $time, rst_n, ena, ui_in, uio_in, uo_out);

  end



  // Stop simulation after 1000ns

  initial begin

    #1000;

    $finish;

  end


=======
  `endif

  // Clock process
  always #5 clk = ~clk;  // 100MHz clock

  // Initial block to set reset and input values
  initial begin
    clk   = 0;
    rst_n = 0;
    ena   = 0;
    ui_in = 0;
    uio_in = 0;
    #20;          // Hold reset for 20ns
    rst_n = 1;    // Release reset
  end

  // Debugging Monitor
  initial begin
    $monitor("Time: %0t | rst_n: %b | ena: %b | ui_in: %h | uio_in: %h | uo_out: %h", 
             $time, rst_n, ena, ui_in, uio_in, uo_out);
  end

  // Stop simulation after 1000ns
  initial begin
    #1000;
    $finish;
  end
>>>>>>> 50cd743 (add trng design)

  // Replace tt_um_example with your module name:

  tt_um_bilal_trng tt_um_bilal_trng (



      // Include power ports for the Gate Level test:
<<<<<<< HEAD

  `ifdef GL_TEST

=======
  `ifdef GL_TEST
>>>>>>> 50cd743 (add trng design)
      .VPWR(VPWR),

      .VGND(VGND),
<<<<<<< HEAD

  `endif


=======
  `endif
>>>>>>> 50cd743 (add trng design)

      .ui_in  (ui_in),    // Dedicated inputs

      .uo_out (uo_out),   // Dedicated outputs

      .uio_in (uio_in),   // IOs: Input path

      .uio_out(uio_out),  // IOs: Output path

      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)

      .ena    (ena),      // enable - goes high when design is selected

      .clk    (clk),      // clock

      .rst_n  (rst_n)     // not reset

  );



endmodule

