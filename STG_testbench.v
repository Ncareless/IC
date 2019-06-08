`timescale 1ns/10ps

module test();
  reg clk,reset;
  reg [3:0] data_in;
  wire [3:0] data_out;
  wire ain,rout;
  reg aout,rin;
  
  STG test_STG(
      .reset(reset),
      .Rin(rin),
      .Aout(aout),
      .Rout(rout),
      .Ain(ain),
      .data_in(data_in),
      .data_out(data_out));
  
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
      aout <= 0;    
      #(CYCLE*1);
      rin <= 0;
      aout <= 1;
      
      #(CYCLE*2);
      rin <= 1;
      data_in <= 2;
      #(CYCLE*1);
      aout <= 0;    
      #(CYCLE*1);
      rin <= 0;
      aout <= 1;
    end    
endmodule