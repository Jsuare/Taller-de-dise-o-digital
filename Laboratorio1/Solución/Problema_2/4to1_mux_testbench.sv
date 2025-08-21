module mux_4to1_tb;
    reg A,B,C,D;       
    reg S1,S2;          
    wire OUT;              
    mux_4to1 uut (
      .A(A),
      .B(B),
      .C(C),
      .D(D),
      .S1(S1),
      .S2(S2),
      .OUT(OUT)
    );
  
     initial begin
       $dumpfile("mux_waveform.vcd");
       $dumpvars(1,mux_4to1_tb);
       $display("Time\tS1 S2\tD C B A\tOUT");

        // primer input set: A=0, B=0, C=0, D=0
        A = 0; B = 0; C = 0; D = 0;

       S1 = 0; S2 = 0; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 0; S2 = 1; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 1; S2 = 0; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 1; S2 = 1; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);

        // Second input set: A=1, B=1, C=1, D=1
        A = 1; B = 1; C = 1; D = 1;

       S1 = 0; S2 = 0; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 0; S2 = 1; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 1; S2 = 0; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 1; S2 = 1; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);

       // Third input set: A=0, B=1, C=0, D=1
        A = 0; B = 1; C = 0; D = 1;

       S1 = 0; S2 = 0; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 0; S2 = 1; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 1; S2 = 0; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);
       S1 = 1; S2 = 1; #5; $display("%0t\t%b  %b\t%b %b %b %b\t%b", $time, S1, S2, D, C, B, A, OUT);

        $finish;
    end
endmodule
