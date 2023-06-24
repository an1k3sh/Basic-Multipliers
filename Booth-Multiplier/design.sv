module booth_multiplier(a, b, p);
  
  input a;
  input b;
  output p;
  
  bit[3:0] a;
  bit[3:0] b;
  bit [7:0] p;
  
  int cnt;
  bit b_n1;
  bit [3:0] q;
  
  always @ (a,b) begin
    
    b_n1 = 0;
    q = b;
    p = 0;
    
    for (cnt = 4; cnt > 0; cnt = cnt - 1) begin
      if (q[0]==0 && b_n1==1)
        p[7:4] = p[7:4] + a;
      else if (q[0]==1 && b_n1==0)
        p[7:4] = p[7:4] + (~a) + 1;
    
      p >>>= 1;
      p[7] = p[6];
      b_n1 = q[0];
      q >>>= 1;
      q[7] = q[6];
  
   end
    
  end
  
endmodule