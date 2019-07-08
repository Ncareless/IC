
`timescale 1ps/1ps
module testbench;
reg signed [31:0] X,Y;
integer number_correct,number_wrong;
reg signed [63:0] check;
wire signed [63:0] SUM;


Booth2  b(Y,X,SUM);

initial  
begin
  number_correct=0;
  number_wrong=0;
  check=0;
  X=32'b0;
  Y=32'b0;
  #10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
  
  
  #10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
 
  
  #10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		
		#10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		
		#10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		
		#10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		
		#10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		
		#10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		
		#10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		
		#10
  X={$random}%2147483648;
  Y={$random}%2147483648;
    check=X*Y;
     #10
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
		 $display("number_correct = %d, number_wrong = %d",number_correct,number_wrong);
end
endmodule
