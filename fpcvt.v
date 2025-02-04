module TwosToSignMag ( 
    input wire [11:0] d,
    output wire [11:0] absoluteNum,
    output wire sign);

    assign sign = d[11];
    if (sign == 1) begin
        assign absoluteNum = ~d[11:0] + 1;
    end
    else begin
        assign absoluteNum = d[11:0];
    end

endmodule

module FloatingPointConvert;

endmodule

module Rounding;

endmodule