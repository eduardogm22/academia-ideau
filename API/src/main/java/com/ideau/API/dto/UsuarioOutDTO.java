package com.ideau.API.dto;

import com.ideau.API.enums.Cargos;
import com.ideau.API.model.SetorEntity;
import com.ideau.API.model.UsuarioEntity;

public record UsuarioOutDTO(
    String id,
    String nome,
    String email,
    Cargos cargo,
    SetorOutDTO setor
) {
    public static UsuarioOutDTO fromEntity(UsuarioEntity usuarioEntity) {
        return new UsuarioOutDTO(
                usuarioEntity.getId(),
                usuarioEntity.getNome(),
                usuarioEntity.getEmail(),
                usuarioEntity.getCargo(),
                new SetorOutDTO(
                        usuarioEntity.getSetor().getId(),
                        usuarioEntity.getSetor().getNome(),
                        usuarioEntity.getSetor().getEmpresaEntity()
                )
        );
    }
}
