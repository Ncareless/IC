`timescale 1ns/10ps
module muller_C(request,ack,next_request,reset);

input request,ack,reset;
output next_request;

wire reset;
wire request,ack;
reg next_request;

always@ (*)
  begin
    if(~reset)
      next_request <= 0;
    else
      begin
        case({request,ack})
            2'b00: begin #5 next_request <= 0; end
            2'b11: begin #5 next_request <= 1; end
        endcase
      end
  end
endmodule