package com.ideau.API.controller;

import com.ideau.API.model.EmpresaEntity;
import com.ideau.API.service.EmpresaService;
import jakarta.websocket.server.PathParam;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/empresa")
public class EmpresaController {
    private final EmpresaService empresaService;

    public EmpresaController(EmpresaService empresaService) {
        this.empresaService = empresaService;
    }

    @PostMapping
    public ResponseEntity<EmpresaEntity> cadastrarEmpresa(@RequestBody EmpresaEntity empresaEntity) {
        return ResponseEntity.ok(empresaService.cadastra(empresaEntity));
    }
    @GetMapping
    public ResponseEntity<EmpresaEntity> retornarEmpresaPorId(@PathParam("id") String id) {
        return ResponseEntity.ok(empresaService.retornaPorId(id));
    }
}
