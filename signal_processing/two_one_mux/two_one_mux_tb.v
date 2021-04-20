`timescale 1s/100ms
`include "two_one_mux.v"

module two_one_mux_tb();
reg I0, I1, sel;
wire out;

TwoOneMux iTwoOneMux(I0, I1, sel, out);
initial
begin
  $monitor("Input0=%b, Input1=%b, Select=%b, Output=%b", I0, I1, sel, out);
  $dumpvars(0, two_one_mux_tb);
  I0 = 0; I1 = 0; sel = 0; #10;
  I0 = 0; I1 = 1; sel = 0; #10;
  I0 = 1; I1 = 0; sel = 0; #10;
  I0 = 1; I1 = 1; sel = 0; #10;
  I0 = 0; I1 = 0; sel = 1; #10;
  I0 = 0; I1 = 1; sel = 1; #10;
  I0 = 1; I1 = 0; sel = 1; #10;
  I0 = 1; I1 = 1; sel = 1; #10;
  $finish;
end
endmodule