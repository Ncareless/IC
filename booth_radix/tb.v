`timescale 1ns/10ps
module testbench;
reg signed [31:0] X,Y;
reg clk,reset;
integer number_correct,number_wrong;
reg signed [63:0] check;
wire signed [63:0] SUM;
wire ain,rout;
reg aout,rin;


Booth2 b2(.data_inY(Y),
			.data_inX(X),
			.SUM(SUM),
			.reset(reset),
			.Rin(rin),
			.Aout(aout),
			.Rout(rout),
			.Ain(ain));

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
  #(CYCLE*1);
  reset = 0;
  #(CYCLE*1);
  reset = 1;
end

initial  
begin
  number_correct=0;
  number_wrong=0;
  check=0;
  X=32'b0;
  Y=32'b0;
  
  #(CYCLE*2);
  X={$random}%2147483648;
  Y={$random}%2147483648;
  check=X*Y;
  rin <= 1;
  aout <= 0;
  #(CYCLE*1);
  aout <= rout ? 0:1;  
  #(CYCLE*1);
  rin <= 0;
  aout <= 1;
  if(check==SUM)
     number_correct=number_correct+1;
  else
     begin
       number_wrong=number_wrong+1;
       $display("%d * %d = %d (%d)",X,Y,SUM,check);
     end
  
end
endmodule
