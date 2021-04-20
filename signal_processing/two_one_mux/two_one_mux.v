module TwoOneMux(input Input0, input Input1, input Select, output Output);

    wire AndOut1, AndOut2, Sbar;

    and(AndOut1, Input1, Select), (AndOut2, Input0, Sbar);
    not(Sbar, Select);
    or(Output, AndOut1, AndOut2);

endmodule