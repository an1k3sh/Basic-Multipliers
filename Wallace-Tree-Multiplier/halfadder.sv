module half_adder (input bit b1, input bit b2, output bit s, output bit c);
  
  assign s = b1 ^ b2;
  assign c = b1 & b2;
  
endmodule