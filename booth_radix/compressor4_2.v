module compressor4_2(i1,i2,i3,i4,Ci,Coin,Coex,s);

input wire i1,i2,i3,i4,Ci;

output wire Coin,Coex,s;

wire s_temp;

assign {Coin,s_temp}=i1+i2+i3;

assign {Coex,s}=Ci+s_temp+i4;


endmodule