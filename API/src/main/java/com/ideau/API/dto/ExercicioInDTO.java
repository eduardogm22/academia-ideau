package com.ideau.API.dto;

import com.ideau.API.model.UsuarioEntity;
import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

public record ExercicioInDTO(
    String nome,
    String descricao,
    String url_video,
    String professor_id
) {
}
