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

import java.util.List;

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
    public ResponseEntity<List<UsuarioOutDTO>> retornarTodosUsuarios() {
        List<UsuarioEntity> lstEntities = usuarioService.retornaTodos();

        List<UsuarioOutDTO> lstRetorno = lstEntities
                .stream()
                .map(UsuarioOutDTO::fromEntity)
                .toList();

        return ResponseEntity.ok().body(lstRetorno);
    }
    @GetMapping("/{id}")
    public ResponseEntity<UsuarioOutDTO> retornarUsuarioPorId(@PathParam("id") String id) {
        UsuarioEntity usuarioEntity = usuarioService.retornaPorId(id);
        return ResponseEntity.ok(
                UsuarioOutDTO.fromEntity(usuarioEntity)
        );
    }
    @PostMapping("/login")
    public ResponseEntity<UsuarioOutDTO> verificarLogin(String username, String senha) {
        UsuarioEntity usuarioEntity = usuarioService.verificaLogin(username, senha);
        return ResponseEntity.ok().body(UsuarioOutDTO.fromEntity(usuarioEntity));
    }
}
