module Apollo11Alu(
    input A2X,
    input AReg,
    input XPlusOne,
    input XClear,
    input YBus,
    input Bus,
    input Shifted,
    input WriteShift,
    input Clear,
    input CarryIn,
    input SumToBus,
    output CarryOut,
    output SumOut
);
    // Blue Input Phase
    wire NorOneOut, NorTwoOut, NorThreeOut;

    nor(NorOneOut, A2X, AReg);
    nor(NorTwoOut, YBus, Bus);
    nor(NorThreeOut, Shifted, WriteShift);

    // Purple Input Phase
    wire NotXFlipFlop, XFlipFlop;
    wire NotYFlipFlop, YFlipFlop;
    // X Latch
    nor(NotXFlipFlop, XPlusOne, NorOneOut, XFlipFlop);
    nor(XFlipFlop, NotXFlipFlop, XClear, Clear);

    // Y Latch
    nor(NotYFlipFlop, NorTwoOut, NorThreeOut, YFlipFlop);
    nor(YFlipFlop, NotYFlipFlop, Clear);

    // Red Phase
    wire NorFourOut, NorFiveOut, NorSixOut, NorSevenOut, NorEightOut, NorNineOut;
    // Nor 4
    nor(NorFourOut, NotXFlipFlop, NotYFlipFlop);
    // Nor 5
    nor(NorFiveOut, XFlipFlop, YFlipFlop);
    // Nor 6
    nor(NorSixOut, NorFourOut, NorFiveOut, CarryIn);
    // Not 7
    nor(NorSevenOut, NorFourOut, NorFiveOut);
    // Nor 8
    nor(NorEightOut, CarryIn);
    // Nor 9
    nor(NorNineOut, NorSevenOut, NorEightOut);
    // Nor 10
    nor(CarryOut, NorFourOut, NorSixOut);
    // Nor 11
    nor(SumOut, NorSixOut, NorNineOut, SumToBus);
endmodule