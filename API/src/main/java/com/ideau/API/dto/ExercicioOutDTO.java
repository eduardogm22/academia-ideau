package com.ideau.API.dto;

import com.ideau.API.model.ExercicioEntity;

public record ExercicioOutDTO(
    String nome,
    String descricao,
    String url_video,
    UsuarioOutDTO professor
) {
    public static ExercicioOutDTO fromEntity(ExercicioEntity exercicioEntity) {
        return new ExercicioOutDTO(
                exercicioEntity.getNome(),
                exercicioEntity.getDescricao(),
                exercicioEntity.getUrl_video(),
                UsuarioOutDTO.fromEntity(exercicioEntity.getProfessor())
        );
    }
}
