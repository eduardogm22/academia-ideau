package com.ideau.API.controller;

import com.ideau.API.dto.TreinoInDTO;
import com.ideau.API.dto.TreinoOutDTO;
import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.TreinoEntity;
import com.ideau.API.service.TreinoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/treino")
public class TreinoController {
    private final TreinoService treinoService;

    public TreinoController(TreinoService treinoService) {
        this.treinoService = treinoService;
    }

    @PostMapping
    public ResponseEntity<TreinoOutDTO> cadastrarTreino(TreinoInDTO treinoInDTO) {
        TreinoEntity treinoEntity = treinoService.cadastra(treinoInDTO);
        return ResponseEntity.ok(
                TreinoOutDTO.fromEntity(treinoEntity)
        );
    }

    @GetMapping(params = "tipoTreino")
    public ResponseEntity<List<TreinoOutDTO>> retornarTreinosPorTipo(@RequestParam TipoTreino tipoTreino) {
        List<TreinoOutDTO> treinos = treinoService.retornaTreinosPorTipo(tipoTreino);
        return ResponseEntity.ok().body(treinos);
    }
}
