module tb_rtc;

reg clk;
reg reset;

wire [3:0] hr_m, hr_l, min_m, min_l, sec_m, sec_l;
wire [6:0] seg_hr_m, seg_hr_l, seg_min_m, seg_min_l, seg_sec_m, seg_sec_l;

rtc uut (
 .clk(clk),
 .reset(reset),
 .hr_m(hr_m), .hr_l(hr_l),
 .min_m(min_m), .min_l(min_l),
 .sec_m(sec_m), .sec_l(sec_l),
 .seg_hr_m(seg_hr_m), .seg_hr_l(seg_hr_l),
 .seg_min_m(seg_min_m), .seg_min_l(seg_min_l),
 .seg_sec_m(seg_sec_m), .seg_sec_l(seg_sec_l)
);

initial begin
 clk = 0;
 forever #5 clk = ~clk;
end

initial begin
 reset = 1;
 #10;
 reset = 0;
 #10000000;
end

initial begin
 $monitor("Time=%0t | %0d%0d:%0d%0d:%0d%0d",
  $time, hr_m, hr_l, min_m, min_l, sec_m, sec_l);
end

endmodule
