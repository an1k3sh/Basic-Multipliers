`include "halfadder.sv"
`include "fulladder.sv"

module wallace_tree_multiplier(a, b, p);
  
  input a;
  input b;
  output p;

  bit[3:0] a;
  bit[3:0] b;
  bit[7:0] p;
    
  bit[4:0][4:0] ab;
  bit b2_1, b2_2;
  bit b3_1, b3_2, b3_3, b3_4;
  bit b4_1, b4_2, b4_3, b4_4, b4_5;
  bit b5_1, b5_2, b5_3, b5_4, b5_5;
  bit b6_1, b6_2, b6_3, b6_4;
  bit b7_1, b7_2;
  bit b_soft;
  bit p1, p2, p3, p4, p5, p6, p7;
  
  assign ab[0][0] = a[0] & b[0];
  assign ab[0][1] = a[0] & b[1];
  assign ab[0][2] = a[0] & b[2];
  assign ab[0][3] = a[0] & b[3];
  
  assign ab[1][0] = a[1] & b[0];
  assign ab[1][1] = a[1] & b[1];
  assign ab[1][2] = a[1] & b[2];
  assign ab[1][3] = a[1] & b[3];
  
  assign ab[2][0] = a[2] & b[0];
  assign ab[2][1] = a[2] & b[1];
  assign ab[2][2] = a[2] & b[2];
  assign ab[2][3] = a[2] & b[3];
  
  assign ab[3][0] = a[3] & b[0];
  assign ab[3][1] = a[3] & b[1];
  assign ab[3][2] = a[3] & b[2];
  assign ab[3][3] = a[3] & b[3];
  
  half_adder ha1 (ab[0][1], ab[1][0], p1, b2_1);
  full_adder fa1 (b2_1, ab[2][0], ab[1][1], b2_2, b3_1);
  full_adder fa2 (b3_1, ab[3][0], ab[2][1], b3_2, b4_1);
  full_adder fa3 (b4_1, ab[3][1], ab[2][2], b4_2, b5_1);
  half_adder ha2 (b5_1, ab[3][2], b5_2, b6_1);
  
  half_adder ha3 (ab[0][2], b2_2, p2, b3_3);
  full_adder fa4 (b3_2, ab[1][2], ab[0][3], b3_4, b4_3);
  half_adder ha4 (b4_2, ab[1][3], b4_4, b5_3);
  half_adder ha5 (b5_2, ab[2][3], b5_4, b6_2);
  half_adder ha6 (b6_1, ab[3][3], b6_3, b7_1);
  
  half_adder ha7 (b3_3, b3_4, p3, b4_5);
  full_adder fa5 (b4_3, b4_4, b4_5, p4, b5_5);
  full_adder fa6 (b5_3, b5_4, b5_5, p5, b6_4);
  full_adder fa7 (b6_2, b6_3, b6_4, p6, b7_2);
  half_adder ha8 (b7_1, b7_2, p7, b_soft);
  
  always @ (a,b) begin
    
    p[0] <= ab[0][0];
    p[1] <= p1;
    p[2] <= p2;
    p[3] <= p3;
    p[4] <= p4;
    p[5] <= p5;
    p[6] <= p6;
    p[7] <= p7;
    
  end
  
endmodule