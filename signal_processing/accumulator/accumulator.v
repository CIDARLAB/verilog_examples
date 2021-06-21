module Accumulator(
    input D0,
    input D1,
    input D2,
    input T5,
    input P,
    input R,
    input B5,
    input B6,
    input B7,
    input B8,
    input B9,
    input B10,
    input B11,
    output LdOut,
    output IncOut,
    output ClrOut,
);
    // Input Gates & First Phase
    wire AndOut, AddOut, DrOut, InprOut, CmaOut, ShrOut, ShlOut;

    and(AndOut, D0, T5);
    and(AddOut, D1, T5);

    and(DrOut, D2, T5);
    and(InprOut, P, B11);

    and(CmaOut, R, B9);
    and(ShrOut, R, B7);
    and(ShlOut, R, B6);

    and(IncOut, R, B5);
    and(ClrOut, R, B11);

    // Accumulation Phase
    or(LdOut, AndOut, AddOut, DrOut, InprOut, CmaOut, ShrOut, ShlOut);
endmodule