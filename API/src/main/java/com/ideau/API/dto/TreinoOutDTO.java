package com.ideau.API.dto;

import com.ideau.API.CategoriasTreino;
import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.TreinoEntity;

public record TreinoOutDTO(
    String id,
    String nome,
    UsuarioOutDTO aluno,
    UsuarioOutDTO professor,
    CategoriasTreino categoria,
    TipoTreino tipoTreino
) {
    public static TreinoOutDTO fromEntity(TreinoEntity treinoEntity) {
        return new TreinoOutDTO(
                treinoEntity.getId(),
                treinoEntity.getNome(),
                UsuarioOutDTO.fromEntity(treinoEntity.getAluno()),
                UsuarioOutDTO.fromEntity(treinoEntity.getProfessor()),
                treinoEntity.getCategoria(),
                treinoEntity.getTipoTreino()
        );
    }
}
