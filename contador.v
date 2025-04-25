module Contador (
    input  wire clk,
    input  wire rst_n,

    input  wire acrescer,
    input  wire decrecer, // Corrigido: nome alterado para "decrecer"

    output reg [7:0] saida
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset ativo em nível lógico baixo: inicializa com 106 (0x6A)
            saida <= 8'h6A;
        end else begin
            // Lógica de contagem
            if (acrescer && !decrecer) begin
                saida <= saida + 1; // Incrementa
            end else if (decrecer && !acrescer) begin
                saida <= saida - 1; // Decrementa
            end
            // Caso ambos estejam inativos ou ativos, mantém o valor
        end
    end

endmodule