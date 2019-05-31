`timescale 1ns/10ps

module test();
  reg clk,reset;
  reg [3:0] data_in;
  wire [3:0] data_out,data1,data2,data3,data4;
  reg ain,rin;
  wire rout,aout,R1,R2,R3,R4;
  
  asynchronous_pipeline 
    test_asynchronous_pipeline(
      .data_in(data_in),
      .request_in(rin),
      .ack_out(aout),
      .data_out(data_out),
      .request_out(rout),
      .ack_in(ain),
      .reset(reset),
      .R1(R1),.R2(R2),.R3(R3),.R4(R4),
      .data1(data1),.data2(data2),.data3(data3),.data4(data4));
  
  localparam CYCLE = 20;
    
  initial
    begin
      clk = 0;
      forever
      #(CYCLE/2)
      clk = ~clk;
    end
   
  initial 
    begin
      reset = 1;
      #10;
      reset = 0;
      #(CYCLE*1);
      reset = 1;
    end 
    
  initial
    begin
      #(CYCLE*2);
      rin <= 1;
      data_in <= 1;
      #(CYCLE*1);
      ain <= 0;    
      #(CYCLE*1);
      rin <= 0;
      ain <= 0;
      
      #(CYCLE*1);
      rin <= 1;
      data_in <= 2;
      #(CYCLE*1);
      ain <= 0;
      #(CYCLE*1);
      rin <= 0;
      ain <= 0;

      #(CYCLE*1);
      rin <= 1;
      data_in <= 3;
      #(CYCLE*1);
      ain <= 0;
      #(CYCLE*1);
      rin <= 0;
      ain <= 0;
      
      #(CYCLE*1);
      rin <= 1;
      data_in <= 4;
      #(CYCLE*1);
      ain <= 0;
      #(CYCLE*1);
      rin <= 0;
      ain <= 0;
      
      #(CYCLE*1);
      rin <= 1;
      data_in <= 5;
      #(CYCLE*1);
      ain <= 0;
      #(CYCLE*1);
      rin <= 0;
      ain <= 0;
    end
      
endmodule
