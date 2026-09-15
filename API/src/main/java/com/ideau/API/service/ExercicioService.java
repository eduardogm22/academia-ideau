package com.ideau.API.service;

import com.ideau.API.dto.ExercicioInDTO;
import com.ideau.API.enums.Cargos;
import com.ideau.API.model.ExercicioEntity;
import com.ideau.API.model.UsuarioEntity;
import com.ideau.API.repository.ExercicioRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import java.util.List;

@Service
public class ExercicioService {
    private final ExercicioRepository exercicioRepository;
    private final UsuarioService usuarioService;

    public ExercicioService(ExercicioRepository exercicioRepository, UsuarioService usuarioService) {
        this.exercicioRepository = exercicioRepository;
        this.usuarioService = usuarioService;
    }

    public ExercicioEntity cadastra(ExercicioInDTO exercicioInDTO) {
        UsuarioEntity professor = usuarioService.retornaPorId(exercicioInDTO.professor_id());
        if(professor == null) {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND, "Professor não encontrado!");
        }
        if(professor.getCargo() != Cargos.ADMIN) {
            throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED, "Usuário não tem permissão para cadastrar exercícios!");
        }

        ExercicioEntity exercicioEntity = new ExercicioEntity(
                null,
                exercicioInDTO.nome(),
                exercicioInDTO.descricao(),
                exercicioInDTO.url_video(),
                professor);

        exercicioRepository.save(exercicioEntity);
        return exercicioEntity;
    }
    public List<ExercicioEntity> retornaTodos() {
        return exercicioRepository.findAll();
    }
}
