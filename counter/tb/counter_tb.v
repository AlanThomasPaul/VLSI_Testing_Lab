`timescale 1ns/1ps

module counter_tb;

reg clk;
reg reset;
reg scan_in;
reg scan_en;
wire scan_out;
wire [3:0] q;

counter_top dut (
  .clk(clk),
  .reset(reset),
  .scan_in(scan_in),
  .scan_en(scan_en),
  .scan_out(scan_out),
  .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin
  $dumpfile("scan.vcd");
  $dumpvars(0, counter_tb);

  clk = 0;
  reset = 1;
  scan_en = 1;
  scan_in = 0;

  #20 reset = 0;

  // SHIFT IN 1011
  scan_in = 1; #10;
  scan_in = 1; #10;
  scan_in = 0; #10;
  scan_in = 1; #10;

  // CAPTURE
  scan_en = 0;
  #20;

  // SHIFT OUT
  scan_en = 1;
  #40;

  $finish;
end

endmodule

