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
            2'b00: begin next_request <= 0; end
            2'b11: begin next_request <= 1; end
        endcase
      end
  end
endmodule