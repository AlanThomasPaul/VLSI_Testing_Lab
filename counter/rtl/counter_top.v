module counter_top (
  input clk,
  input reset,
  input scan_in,
  input scan_en,
  output scan_out,
  output [3:0] q
);

wire [3:0] d;
assign d = q + 1'b1;

// Scan chain stitching
counter ff0 (clk, reset, d[0], scan_in, scan_en, q[0]);
counter ff1 (clk, reset, d[1], q[0],    scan_en, q[1]);
counter ff2 (clk, reset, d[2], q[1],    scan_en, q[2]);
counter ff3 (clk, reset, d[3], q[2],    scan_en, q[3]);

assign scan_out = q[3];

endmodule

