package com.ideau.API.controller;

import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.TreinoEntity;
import com.ideau.API.service.TreinoService;
import org.apache.coyote.Response;
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

    @GetMapping(params = "tipoTreino")
    public ResponseEntity<List<TreinoEntity>> retornarTreinosPorTipo(@RequestParam TipoTreino tipoTreino) {
        List<TreinoEntity> treinos = treinoService.retornaTreinosPorTipo(tipoTreino);
        return ResponseEntity.ok().build();
    }
}
