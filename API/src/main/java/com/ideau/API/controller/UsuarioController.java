package com.ideau.API.controller;

import com.ideau.API.dto.UsuarioInDTO;
import com.ideau.API.dto.UsuarioOutDTO;
import com.ideau.API.model.UsuarioEntity;
import com.ideau.API.service.UsuarioService;
import jakarta.websocket.server.PathParam;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {
    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @PostMapping
    public ResponseEntity<UsuarioOutDTO> cadastrarUsuario(UsuarioInDTO usuarioInDTO) {
        return ResponseEntity.ok().body(usuarioService.cadastra(usuarioInDTO));
    }
    @GetMapping
    public ResponseEntity<UsuarioOutDTO> retornarUsuarioPorId(@PathParam("id") String id) {
        UsuarioEntity usuarioEntity = usuarioService.retornaPorId(id);
        return ResponseEntity.ok(
                UsuarioOutDTO.fromEntity(usuarioEntity)
        );
    }
}
