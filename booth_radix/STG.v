module STG(reset,Rin,Aout,Rout,Ain,data_in,data_out);

input reset,Rin,Aout;
input [63:0]data_in;
output Rout,Ain;
output [63:0]data_out;

reg Rout,Ain,Lt;
reg [63:0]data_out;

always@(*)
begin
  if(reset==0)
    begin
      Rout <= 0;
      Ain <= 0;
      Lt <= 0;
    end
  else
    begin
      Rout <= (Rin && (Rout || ~Aout)) || (~Aout && Rout);
      Ain <= Rout;
      Lt <= Rout;
    end    
end

always@(negedge reset or posedge Lt)
begin
  if(reset==0)
    data_out <= 0;
  else
    data_out <= data_in;
end
endmodule