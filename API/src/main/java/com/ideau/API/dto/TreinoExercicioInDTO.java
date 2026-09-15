package com.ideau.API.dto;

public record TreinoExercicioInDTO(
    String id,
    String treino_id,
    String exercicio_id,
    Integer ordem,
    Integer series,
    Integer repeticoes,
    Integer carga,
    Integer descansoEmSegundos
) {
}
