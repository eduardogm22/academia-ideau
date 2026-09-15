package com.ideau.API.controller;

import com.ideau.API.dto.ExercicioInDTO;
import com.ideau.API.dto.ExercicioOutDTO;
import com.ideau.API.model.ExercicioEntity;
import com.ideau.API.service.ExercicioService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/exercicio")
public class ExercicioController {
    private final ExercicioService exercicioService;

    public ExercicioController(ExercicioService exercicioService) {
        this.exercicioService = exercicioService;
    }

    @PostMapping
    public ResponseEntity<ExercicioOutDTO> cadastrarExercicio(@RequestBody ExercicioInDTO exercicioInDTO) {
        ExercicioEntity exercicioEntity = exercicioService.cadastra(exercicioInDTO);
        return ResponseEntity.ok().body(ExercicioOutDTO.fromEntity(exercicioEntity));
    }
    @GetMapping
    public ResponseEntity<List<ExercicioOutDTO>> retornarTodosExercicios() {
        List<ExercicioEntity> lstEntities = exercicioService.retornaTodos();

        List<ExercicioOutDTO> lstRetorno = lstEntities
                                            .stream()
                                            .map(ExercicioOutDTO::fromEntity)
                                            .toList();

        return ResponseEntity.ok().body(lstRetorno);
    }
}
