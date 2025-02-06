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

module FloatingPointConvert (
    input wire [11:0] absoluteNum,
    output wire [2:0] exponent,
    output wire [3:0] significand,
    output wire fifth_bit
);

    always @(*) begin

        exponent = 0;
        significand = absoluteNum[3:0];
        fifth_bit = 0;

        if (absoluteNum[10]) begin
            exponent = 7;
            significand = absoluteNum[9:6];
            fifth_bit = absoluteNum[5];
        end
        else if (absoluteNum[9]) begin
            exponent = 6;
            significand = absoluteNum[8:5];
            fifth_bit = absoluteNum[4];
        end
        else if (absoluteNum[8]) begin
            exponent = 5;
            significand = absoluteNum[7:4];
            fifth_bit = absoluteNum[3];
        end
        else if (absoluteNum[7]) begin
            exponent = 4;
            significand = absoluteNum[6:3];
            fifth_bit = absoluteNum[2];
        end
        else if (absoluteNum[6]) begin
            exponent = 3;
            significand = absoluteNum[5:2];
            fifth_bit = absoluteNum[1];
        end
        else if (absoluteNum[5]) begin
            exponent = 2;
            significand = absoluteNum[4:1];
            fifth_bit = absoluteNum[0];
        end
        else if (absoluteNum[4]) begin
            exponent = 1;
            significand = absoluteNum[3:0];
            fifth_bit = 0;
        end
    end



endmodule

module Rounding(
    input wire [3:0] exponent,
    input wire fifth_bit,
    input wire [4:0] significand,
    output wire [2:0] E,
    output wire [3:0] F
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