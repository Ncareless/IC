`timescale 1ns/10ps
module asynchronous_pipeline(
    data_in,request_in,ack_out,data_out,request_out,ack_in,reset,R1,R2,R3,R4,data1,data2,data3,data4
  );
  
input [3:0]data_in;
input request_in;
output ack_out;
output [3:0]data_out,data1,data2,data3,data4;
output request_out,R1,R2,R3,R4;
input ack_in;
input reset;

wire [3:0] data_in;
reg [3:0] data_out;
wire request_in,ack_out,request_out,ack_in;
wire reset;

wire A1,A2,A3,A4,R1,R2,R3,R4,EN1,EN2,EN3,EN4,EN5;
reg [3:0] data1,data2,data3,data4;

muller_C C1(.request(request_in),.ack(~A1),.next_request(R1),.reset(reset));
assign EN1 = R1;
assign ack_out = R1;
always@ (posedge EN1 or negedge reset)
begin
  if(~reset)
    data1 <= 0;
  else
    data1 <= data_in;
end

muller_C C2(.request(R1),.ack(~A2),.next_request(R2),.reset(reset));
assign EN2 = R2;
assign A1 = R2;
always@ (posedge EN2 or negedge reset)
begin
  if(~reset)
    data2 <= 0;
  else
    data2 <= data1;
end

muller_C C3(.request(R2),.ack(~A3),.next_request(R3),.reset(reset));
assign EN3 = R3;
assign A2 = R3;
always@ (posedge EN3 or negedge reset)
begin
  if(~reset)
    data3 <= 0;
  else
    data3 <= data2;
end

muller_C C4(.request(R3),.ack(~A4),.next_request(R4),.reset(reset));
assign EN4 = R4;
assign A3 = R4;
always@ (posedge EN4 or negedge reset)
begin
  if(~reset)
    data4 <= 0;
  else
    data4 <= data3;
end

muller_C C5(.request(R4),.ack(~ack_in),.next_request(request_out),.reset(reset));
assign EN5 = request_out;
assign A4 = request_out;
always@ (posedge EN5)
    data_out <= data4;
endmodule
  