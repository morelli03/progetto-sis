`timescale 1ns / 1ns

module tb_MorraCinese();

  	// File descriptors.
  	integer tbf, outf;
  
  reg clk; reg [1:0]primo, secondo; reg inizia;
  wire [1:0] manche; wire [1:0] partita;
    
    MorraCinese mor(
      	clk, primo, secondo, inizia,
        manche, partita);
    
    always #5 clk = ~clk;
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      tbf = $fopen("testbench.script", "w");
      outf = $fopen("output_verilog.txt", "w");
      $fdisplay(tbf, "read_blif FSMD.blif");
      
      clk = 1'b0;
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b01;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //inizia
      inizia = 1'b1;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //pareggio
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b10;  //inizia
      inizia = 1'b1;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b10;  //vince p2
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b10;  //vince p2 (stessa mossa)
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b11;  //vince p1
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b00;
      secondo = 2'b00;  //non valido
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b10;  //vince p2
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b10;
      secondo = 2'b11;  //vince p2
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);
      primo = 2'b01;
      secondo = 2'b10;  //vince p2
      inizia = 1'b0;
      $fdisplay(tbf, "simulate %b %b %b %b %b", primo[1], primo[0], secondo[1], secondo[0], inizia);
      #10
      $fdisplay(outf, "Outputs: %b %b %b %b", manche[1], manche[0], partita[1], partita[0]);

      $fdisplay(tbf, "quit");
      $fclose(tbf);
      $fclose(outf);
      $finish;
    end
endmodule
