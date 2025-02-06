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
    output reg [2:0] exponent,
    output reg [3:0] significand
);

    always @(*) begin

        exponent = 0;
        significand = absoluteNum[3:0];

        if (absoluteNum[10]) begin
            exponent = 7;
            significand = absoluteNum[9:6];
        end
        else if (absoluteNum[9]) begin
            exponent = 6;
            significand = absoluteNum[8:5];
        end
        else if (absoluteNum[8]) begin
            exponent = 5;
            significand = absoluteNum[7:4];
        end
        else if (absoluteNum[7]) begin
            exponent = 4;
            significand = absoluteNum[6:3];
        end
        else if (absoluteNum[6]) begin
            exponent = 3;
            significand = absoluteNum[5:2];
        end
        else if (absoluteNum[5]) begin
            exponent = 2;
            significand = absoluteNum[4:1];
        end
        else if (absoluteNum[4]) begin
            exponent = 1;
            significand = absoluteNum[3:0];
        end
    end



endmodule

module Rounding;

endmodule