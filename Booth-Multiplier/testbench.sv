module booth_multiplier_tb;
  
  bit[3:0] a;
  bit[3:0] b;
  
  byte p;
  
  booth_multiplier booth_multiplier (.a(a), .b(b), .p(p));
  
  initial begin
    
    a <= 2;
    b <= 3;

    #2 $display("Product:%d",p);
    
  end
  
endmodule