`timescale 1ns / 1ps


module sim_4x1mux;

    logic [3:0] A, B, C, D;
    logic [1:0] select;
    logic [3:0] mux_out;
    
    // Instantiate device under test
    mux4x1 #(.W(4)) DUT (
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .select(select), 
        .mux_out(mux_out)
    );

    initial begin
        // Stimulus
        A = 4'b0000;    // 0
        B = 4'b0101;    // 5
        C = 4'b1010;    // 10
        D = 4'b1111;    // 15

        select = 2'b00; #2;
        select = 2'b01; #2;
        select = 2'b10; #2;
        select = 2'b11; #2;
        select = 2'b00; #2;

        $finish;   
    end

    // Monitor values
    initial begin
        $display("Time\tSel\tA\tB\tC\tD\tOut");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", 
                  $time, select, A, B, C, D, mux_out);
    end
    
endmodule
