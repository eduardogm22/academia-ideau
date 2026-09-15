package com.ideau.API.dto;

public record TreinoExercicioOutDTO(
    String id,
    TreinoOutDTO treino,
    ExercicioOutDTO exercicio,
    Integer ordem,
    Integer series,
    Integer repeticoes,
    Integer carga,
    Integer descansoEmSegundos
) {
}
