module wallacetree_multiplier_tb;
  
  bit[3:0] a;
  bit[3:0] b;
  
  byte p;
  
  wallace_tree_multiplier wallace_tree_multiplier (.a(a), .b(b), .p(p));
  
  initial begin
    
    a <= 3;
    b <= 4;

    #1 $display("Product:%d",p);
    
  end
  
endmodule