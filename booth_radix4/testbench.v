
`timescale 1ps/1ps
module testbench;
reg signed [31:0] X,Y;
integer i;
integer number_correct,number_wrong;
reg signed [63:0] check;
wire signed [63:0] SUM;


Booth2  b(Y,X,SUM);

initial  
begin
  // $sdf_annotate("Booth2.sdf", testbench.b, , "MAXIMUM") ;
  number_correct=0;
  number_wrong=0;
  X=32'b0;
  Y=32'b0;
  #10
  X={$random}%2147483648;
  Y={$random}%2147483648;
 /* for(i=1;i<10000;i=i+1) 
  begin
    if(i%2==0)
      begin
       X=0-{$random}%2147483648;
        Y={$random}%2147483648;
      end
    else if(i%3==0)
      begin
         X={$random}%2147483648;
        Y=0-{$random}%2147483648;
      end
    else if(i%5==0)
      begin
         X=0-{$random}%2147483648;
         Y=0-{$random}%2147483648;
      end
    else
      begin
         X={$random}%2147483648;
         Y={$random}%2147483648;
      end
*/

    check=X*Y;
     #2000
     if(check==SUM)
        number_correct=number_correct+1;
     else
        begin
          number_wrong=number_wrong+1;
          $display("%d * %d = %d (%d)",X,Y,SUM,check);
        end
  //end
  $display("number_correct = %d, number_wrong = %d",number_correct,number_wrong);
end
endmodule
