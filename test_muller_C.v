`timescale 1ns/10ps

module test_muller_C();

reg clk,request,ack,reset;
wire next_request;

localparam CYCLE = 20;

muller_C C(
    .request(request),.ack(ack),.next_request(next_request),.reset(reset)
  );
    
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
      #(CYCLE*3);
      reset = 1;
    end 
    
  initial
    begin
      #(CYCLE*6);
      request <= 0;
      ack <= 0;
      #(CYCLE*1);
      request <= 0;
      ack <= 1;
      #(CYCLE*1);
      request <= 1;
      ack <= 0;
      #(CYCLE*1);
      request <= 1;
      ack <= 1;
      #(CYCLE*1);
      request <= 1;
      ack <= 0;
      #(CYCLE*1);
      request <= 0;
      ack <= 1;
      #(CYCLE*1);
      request <= 0;
      ack <= 0;
    end
endmodule