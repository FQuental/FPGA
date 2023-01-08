`timescale 1ns / 1ps
module ffd_TB;
    reg clk, clk_tb, rst, habilita, dados;
    wire saida;
//Inicializacao de sinais e set do tempo final de simulacao (comando STOP)           
    initial begin
        $display ("###################################################");
        $display ("#####           Analise dos sinais            #####");
        $display ("###################################################");
        $display ("Inicio da Simulacao:");
            clk = 0; clk_tb = 0;
            $display ("Aplicando o Reset: %d", $time);
            rst = 1;
            habilita = 0;
            dados = 0;
            #33 rst = 0; 
            $display ("Fim do Reset: %d", $time);
            #10 habilita = 1;
       #500 $stop;
    end
//Sinais de clock de controle E/S
    always begin
            #27 clk_tb = 1;
            #13 clk_tb = 0;
           end
//Teste da saida atual com a saida esperada
    always @ (posedge clk_tb)
      if (saida != dados)
        begin
          $display ("Erro verificado no DUT - Tempo: %d",$time);
          $display ("Valor esperado %d, Valor obtido: %d", dados, saida);
        end
        else
        begin
         $display ("DUT operando corretamente no tempo(subida clk): %d", $time);
        end
//Aplicacao dos estimulos
    always #20 clk = ~clk;
    always begin
        #47  dados = 1;
        #73  dados = 0;
        #46  dados = 0;
        #47  dados = 1; 
        #65  dados = 0;
        #43  dados = 1;
        #13  dados = 0;
        #44  dados = 1;   //na segunda analise comente essa
//      #40  dados = 1;   //na segunda analise retire comentario
        #65  dados = 0;
        #1000;
    end
//Circuito a ser testado (DUT)
    ffd DUT(saida, dados, clk, rst, habilita); 
endmodule
