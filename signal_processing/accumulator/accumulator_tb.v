`timescale 1s/100ms
`include "accumulator.v"

module accumulator_tb();
reg I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13;
wire O1, O2, O3;

Accumulator iAccumulator(I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, O1, O2, O3);
initial
begin
  $monitor("A2X=%b, AReg=%b, XPLusOne=%b, XClear=%b YBus=%b, Bus=%b, Shifted=%b, WriteShift=%b, Clear=%b, CarryIn=%b, SumToBus=%b, CarryOut=%b, SumOut=%b", I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, O1, O2);
  $dumpvars(0, apollo_11_alu_tb);
  I0 = 0; I1 = 0; I2 = 0; I3 = 0; I4 = 0; I5 = 0; I6 = 0; I7 = 0; I8 = 0; I9 = 0; I10 = 0; #10;
  $finish;
end
endmodule