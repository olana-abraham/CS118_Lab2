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

module Rounding(
    input wire [3:0] exponent,
          wire fifth_bit,
          wire [4:0] significand
    output wire [2:0] E,
           wire [3:0] F;
);

    if(fifth_bit == 1) begin

        significand = significand + 1;

        if(significand[4] == 1) begin
        
            exponent = exponent + 1;
            significand = significand >> 1;

            if(exponent[3] == 1) begin
                exponent = 'b111;
                significand = 'b1111;
            end
        end
    end

    assign E = exponent[2:0];
    assign F = significand[3:0];

endmodule