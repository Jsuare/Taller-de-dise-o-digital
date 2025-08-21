module mux_4to1(A,B,C,D,S1,S2,OUT);
  input A,B,C,D,S1,S2;
  output OUT;
  wire x1,x2;
  
  mux_2to1 m1(A,B,S1,x1);
  mux_2to1 m2(C,D,S1,x2);
  mux_2to1 m3(x1,x2,S2,OUT);
  
endmodule  

module mux_2to1(X,Y,S,Z);
  input X,Y,S;
  output Z;
   
  assign Z = (S== 1'b0) ? X : Y;
endmodule
