module full_adder (input bit b1, input bit b2, input bit b3, output bit s, output bit c);
  
  assign s = b1 ^ b2 ^ b3;
  assign c = (b1 & b2) | (b2 & b3) | (b3 & b1);
  
endmodule