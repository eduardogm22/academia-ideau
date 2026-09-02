package com.ideau.API.dto;

import com.ideau.API.model.EmpresaEntity;

public record SetorOutDTO(
        String id,
        String nome,
        EmpresaEntity empresa
) {
}
