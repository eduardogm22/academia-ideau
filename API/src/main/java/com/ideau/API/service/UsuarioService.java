package com.ideau.API.service;

import com.ideau.API.dto.UsuarioInDTO;
import com.ideau.API.dto.UsuarioOutDTO;
import com.ideau.API.model.SetorEntity;
import com.ideau.API.model.UsuarioEntity;
import com.ideau.API.repository.UsuarioRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

@Service
public class UsuarioService {
    private final UsuarioRepository usuarioRepository;
    private final SetorService setorService;

    public UsuarioService(UsuarioRepository usuarioRepository, SetorService setorService) {
        this.usuarioRepository = usuarioRepository;
        this.setorService = setorService;
    }

    public UsuarioOutDTO cadastra(UsuarioInDTO usuarioInDTO) {
        if (usuarioRepository.existsByUsername(usuarioInDTO.username())) {
            throw new HttpClientErrorException(HttpStatusCode.valueOf(409), "Username não disponível. Escolha outro.");
        }
        SetorEntity setorEntity = setorService.retornaPorId(usuarioInDTO.setor_id());

        UsuarioEntity usuarioEntity = new UsuarioEntity(
                usuarioInDTO.nome(),
                usuarioInDTO.email(),
                usuarioInDTO.cargo(),
                setorEntity,
                usuarioInDTO.username(),
                usuarioInDTO.senha()
        );
        usuarioRepository.save(usuarioEntity);
        return UsuarioOutDTO.fromEntity(usuarioEntity);
    }
    public UsuarioEntity retornaPorId(String id) {
        UsuarioEntity usuarioEntity = usuarioRepository.findById(id).orElse(null);
        if (usuarioEntity == null) {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND);
        }
        return usuarioEntity;
    }
}
