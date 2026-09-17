package com.ideau.API.controller;

import com.ideau.API.dto.SetorInDTO;
import com.ideau.API.dto.SetorOutDTO;
import com.ideau.API.model.SetorEntity;
import com.ideau.API.service.SetorService;
import jakarta.websocket.server.PathParam;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/setor")
public class SetorController {
    private final SetorService setorService;

    public SetorController(SetorService setorService) {
        this.setorService = setorService;
    }

    @PostMapping
    public ResponseEntity<SetorOutDTO> cadastrarSetor(SetorInDTO setorInDto) {
        SetorEntity setorEntity = setorService.cadastra(setorInDto);
        return ResponseEntity.ok(new SetorOutDTO(
                setorEntity.getId(),
                setorEntity.getNome(),
                setorEntity.getEmpresaEntity()
        ));
    }
    @GetMapping
    public ResponseEntity<SetorOutDTO> retornarSetorPorId(@PathParam("id") String id) {
        SetorEntity setorEntity = setorService.retornaPorId(id);
        return ResponseEntity.ok(new SetorOutDTO(
                setorEntity.getId(),
                setorEntity.getNome(),
                setorEntity.getEmpresaEntity()
        ));
    }
}
