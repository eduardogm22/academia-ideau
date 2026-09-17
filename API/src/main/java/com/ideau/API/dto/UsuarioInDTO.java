package com.ideau.API.dto;

import com.ideau.API.enums.Cargos;
import com.ideau.API.model.SetorEntity;
import com.ideau.API.model.UsuarioEntity;

public record UsuarioInDTO(
    String id,
    String nome,
    String email,
    Cargos cargo,
    String setor_id,
    String username,
    String senha
) {
    public static UsuarioInDTO fromEntity(UsuarioEntity usuarioEntity) {
        return new UsuarioInDTO(
                usuarioEntity.getId(),
                usuarioEntity.getNome(),
                usuarioEntity.getEmail(),
                usuarioEntity.getCargo(),
                usuarioEntity.getSetor().getId(),
                usuarioEntity.getUsername(),
                usuarioEntity.getSenha()
        );
    }
}
