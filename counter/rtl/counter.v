module counter (
  input clk,
  input reset,
  input d,
  input si,
  input scan_en,
  output reg q
);

always @(posedge clk or posedge reset) begin
  if (reset)
    q <= 1'b0;
  else if (scan_en)
    q <= si;
  else
    q <= d;
end

endmodule

