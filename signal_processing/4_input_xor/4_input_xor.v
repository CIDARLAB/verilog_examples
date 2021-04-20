module m21(Output, Input0, Input1, Select);

    output Output;
    input Input0, Input1, Select;
    wire AndOut1, AndOut2, Sbar;

    and (AndOut1, Input1, Select), (AndOut2, Input0, Sbar);
    not (Sbar, Select);
    or (Output, AndOut1, AndOut2);

endmodule