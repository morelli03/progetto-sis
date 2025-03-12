module MorraCinese(
  input clk, reg [1:0] primo, reg [1:0] secondo, inizia,
  output reg [1:0] manche, reg [1:0] partita);
 
  //registri nel datapath
  reg [2:0] state = 3'b000;
  reg [4:0] reg_clk_counter = 5'b00000;
  reg [4:0] reg_manche_max = 5'b00000;
  reg [3:0] stato_manche = 4'b0000;
  reg [1:0] mossa_vincente = 2'b00;
  reg flag;
  reg pareggio;

  
  //segnali di stato
  reg manche_min = 1'b0;
  reg not_valid = 1'b0;
  reg manche_max = 1'b0;

  // State encodings
  parameter [2:0]
  INIZIO = 3'b000,        //A
  VANTAGGIO_P1 = 3'b001,    //B
  VANTAGGIO_P2 = 3'b010,    //C
  PAREGGIO = 3'b011,      //D
  VINCE_P1 = 3'b100,      //E
  VINCE_P2 = 3'b101,      //F
  FINE_PAREGGIO = 3'b110;   //G


  //   ---   DATAPATH   ---   //

  always @(posedge clk) begin
    //Manche manche max
    if(reg_clk_counter == 5'b00000) begin
      reg_manche_max = {primo,secondo};     //imposto il registro all'inizio della partita
    reg_manche_max = reg_manche_max + 5'b00100;
    end
    //Counter e reset di cicli di clock
    if (inizia == 1'b1) begin
      reg_clk_counter = 5'b00000;
    end
    else if(not_valid == 1'b0) begin
      reg_clk_counter = reg_clk_counter + 1;
    end

    //Segnale manche minime
    if (reg_clk_counter > 5'b00011) begin
      manche_min = 1'b1;
    end
    else begin
      manche_min = 1'b0;
    end

    //Verifico quando la partita è arrivata al massimo delle manche giocabili
    if((reg_manche_max + 1) == reg_clk_counter) begin
      manche_max = 1'b1;
    end 
    else begin
      manche_max = 1'b0;
    end      
    
    //segnale not_valid ---------------------------------------
    
    if(flag == 1'b0 && mossa_vincente == primo && reg_clk_counter != 5'b00000 && pareggio == 0) begin
      not_valid = 1'b1;
    end 
    else if(flag == 1'b1 && mossa_vincente == secondo && reg_clk_counter != 5'b00000 && pareggio == 0) begin
      not_valid = 1'b1;
    end else begin
      not_valid = 1'b0;
    end
    
    if(((primo == 2'b11 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b10) || (primo == 2'b01 && secondo == 2'b01)) && primo != mossa_vincente) begin
      not_valid = 1'b0;
      pareggio = 1'b1; //immunità per il prossimo ciclo
    end else begin
      pareggio = 1'b0;
    end
    
    if(primo == 2'b00 || secondo == 2'b00) begin
      not_valid = 1'b1;
    end
    
    if((primo == 2'b01 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b01) || (primo == 2'b11 && secondo == 2'b10) && not_valid == 1'b0 && primo != 00 && secondo != 00) begin
      mossa_vincente = primo;
      flag = 1'b0;      
    end
    if((primo == 2'b11 && secondo == 2'b01) || (primo == 2'b10 && secondo == 2'b11) || (primo == 2'b01 && secondo == 2'b10) && not_valid == 1'b0 && primo != 00 && secondo != 00) begin
      mossa_vincente = secondo;
      flag = 1'b1;
    end
    
  end
  
  
  //   ---   FSM   ---   ///
 
  always @(primo, secondo, inizia, manche, partita, not_valid, manche_min, manche_max) begin
    case (state)
      INIZIO: begin //A
        if(primo == 2'b00 || secondo == 2'b00 || inizia == 1'b1) begin
          state = INIZIO;
            manche = 2'b00;
            partita = 2'b00;
        end
        if(((primo == 2'b01 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b01) || (primo == 2'b11 && secondo == 2'b10)) && inizia == 1'b0) begin
          state = VANTAGGIO_P1;
          manche = 2'b01;
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b01) || (primo == 2'b10 && secondo == 2'b11) || (primo == 2'b01 && secondo == 2'b10)) && inizia == 1'b0) begin
          state = VANTAGGIO_P2;
          manche = 2'b10;
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b10) || (primo == 2'b01 && secondo == 2'b01)) && inizia == 1'b0) begin
          state = PAREGGIO;
          manche = 2'b11;
          partita = 2'b00;
        end
      end
      
      VANTAGGIO_P1: begin //B
        if(inizia == 1'b1) begin
          state = INIZIO;
          manche = 2'b00;  //inizia a 1
          partita = 2'b00;
        end
        if(primo == 2'b00 || secondo == 2'b00 || not_valid == 1'b1) begin
          state = VANTAGGIO_P1;
          manche = 2'b00;   //manche non valida
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b10) || (primo == 2'b01 && secondo == 2'b01)) && not_valid == 1'b0 && manche_max == 1'b0 && inizia == 1'b0) begin
          state = VANTAGGIO_P1;
          manche = 2'b11;   //manche pareggio
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b01) || (primo == 2'b10 && secondo == 2'b11) || (primo == 2'b01 && secondo == 2'b10)) && not_valid == 1'b0 && manche_max == 1'b0 && inizia == 1'b0) begin
          state = PAREGGIO;
          manche = 2'b10;    //manche vince giocatore 2
          partita = 2'b00; 
        end
        if(((primo == 2'b01 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b01) || (primo == 2'b11 && secondo == 2'b10)) && not_valid == 1'b0 && manche_min == 1'b0 && inizia == 1'b0) begin
          state = VANTAGGIO_P1;
          manche = 2'b01;  //manche vince giocatore 1 (ritorna in vantaggio_p1 perche ha vinto la manche ma le manche minime non sono ancora raggiunte)
          partita = 2'b00;
        end
        if(((primo == 2'b01 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b01) || (primo == 2'b11 && secondo == 2'b10)) && not_valid == 1'b0 && manche_min == 1'b1 && inizia == 1'b0) begin
          state = VINCE_P1;
          manche = 2'b01;  //partita vince giocatore 1
          partita = 2'b01;
        end
        if(manche_min == 1'b1 && manche_max == 1'b1) begin
          state = VINCE_P1;
          manche = 2'b00; //manche massime raggiunte
          partita = 2'b01;
        end
      end
      
      VANTAGGIO_P2: begin //C
        if(inizia == 1'b1) begin
          state = INIZIO;
          manche = 2'b00;  //inizia a 1
          partita = 2'b00;
        end
        if(primo == 2'b00 || secondo == 2'b00 || not_valid == 1'b1) begin
          state = VANTAGGIO_P2;
          manche = 2'b00;  //manche non valida
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b10) || (primo == 2'b01 && secondo == 2'b01)) && not_valid == 1'b0 && manche_max == 1'b0 && inizia == 1'b0) begin
          state = VANTAGGIO_P2;
          manche = 2'b11;   //manche pareggio
          partita = 2'b00;
        end
        if(((primo == 2'b01 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b01) || (primo == 2'b11 && secondo == 2'b10)) && not_valid == 1'b0 && manche_max == 1'b0 && inizia == 1'b0) begin
          state = PAREGGIO;
          manche = 2'b01;   //manche vince giocatore 1
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b01) || (primo == 2'b10 && secondo == 2'b11) || (primo == 2'b01 && secondo == 2'b10)) && not_valid == 1'b0 && manche_min == 1'b0 && inizia == 1'b0) begin
          state = VANTAGGIO_P2;
          manche = 2'b10;  //manche vince giocatore 2
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b01) || (primo == 2'b10 && secondo == 2'b11) || (primo == 2'b01 && secondo == 2'b10)) && not_valid == 1'b0 && manche_min == 1'b1 && inizia == 1'b0) begin
          state = VINCE_P2;
          manche = 2'b10;  //partita vince giocatore 2
          partita = 2'b10;
        end
        if(manche_min == 1'b1 && manche_max == 1'b1) begin
          state = VINCE_P2;
          manche = 2'b00; //manche massime raggiunte
          partita = 2'b10;
        end
      end
      
      PAREGGIO: begin //D
        if(inizia == 1'b1) begin
          state = INIZIO;
          manche = 2'b00;  //inizia a 1
          partita = 2'b00;
        end
        if(primo == 2'b00 || secondo == 2'b00 || not_valid == 1'b1) begin
          state = PAREGGIO;
          manche = 2'b00;  //manche non valida
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b10) || (primo == 2'b01 && secondo == 2'b01)) && not_valid == 1'b0 && manche_max == 1'b0 && inizia == 1'b0) begin
          state = PAREGGIO;
          manche = 2'b11;   //manche pareggio
          partita = 2'b00;
        end
        if(((primo == 2'b01 && secondo == 2'b11) || (primo == 2'b10 && secondo == 2'b01) || (primo == 2'b11 && secondo == 2'b10)) && not_valid == 1'b0 && manche_max == 1'b0 && inizia == 1'b0) begin
          state = VANTAGGIO_P1;
          manche = 2'b01;   //manche vince giocatore 1
          partita = 2'b00;
        end
        if(((primo == 2'b11 && secondo == 2'b01) || (primo == 2'b10 && secondo == 2'b11) || (primo == 2'b01 && secondo == 2'b10)) && not_valid == 1'b0 && manche_max == 1'b0 && inizia == 1'b0) begin
          state = VANTAGGIO_P2;
          manche = 2'b10;  //manche vince giocatore 2
          partita = 2'b00;
        end
        if(manche_min == 1'b1 && manche_max == 1'b1) begin
          state = FINE_PAREGGIO;
          manche = 2'b00; //manche massime raggiunte
          partita = 2'b11;
        end
      end
      
      VINCE_P1: begin //E
        if(inizia == 1'b1) begin
          state = INIZIO;
          manche = 2'b00;  //inizia a 1
          partita = 2'b00;
        end
        manche = 2'b00;
      end
      
      VINCE_P2: begin //F
        if(inizia == 1'b1) begin
          state = INIZIO;
          manche = 2'b00;  //inizia a 1
          partita = 2'b00;
        end
        manche = 2'b00;
      end
      
      FINE_PAREGGIO: begin //G
    if(inizia == 1'b1) begin
          state = INIZIO;
          manche = 2'b00;  //inizia a 1
          partita = 2'b00;
        end
        manche = 2'b00;
      end
      default:
        state = INIZIO;
    endcase
  end

endmodule