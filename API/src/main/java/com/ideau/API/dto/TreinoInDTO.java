package com.ideau.API.dto;

import com.ideau.API.CategoriasTreino;
import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.TreinoEntity;

public record TreinoInDTO(
    String nome,
    String aluno_id,
    String professor_id,
    CategoriasTreino categoria,
    TipoTreino tipoTreino
) {
}
