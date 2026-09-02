package com.ideau.API.service;

import com.ideau.API.dto.TreinoInDTO;
import com.ideau.API.dto.TreinoOutDTO;
import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.TreinoEntity;
import com.ideau.API.model.UsuarioEntity;
import com.ideau.API.repository.TreinoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Stream;

@Service
public class TreinoService {
    private final TreinoRepository treinoRepository;
    private final UsuarioService usuarioService;

    public TreinoService(TreinoRepository treinoRepository, UsuarioService usuarioService) {
        this.treinoRepository = treinoRepository;
        this.usuarioService = usuarioService;
    }

    public TreinoEntity cadastra(TreinoInDTO treinoInDTO) {
        UsuarioEntity aluno = usuarioService.retornaPorId(treinoInDTO.aluno_id());
        UsuarioEntity professor = usuarioService.retornaPorId(treinoInDTO.professor_id());

        TreinoEntity treinoEntity = new TreinoEntity(
                treinoInDTO.nome(),
                aluno,
                professor,
                treinoInDTO.categoria(),
                treinoInDTO.tipoTreino()
        );
        treinoRepository.save(treinoEntity);
        return treinoEntity;
    }

    public List<TreinoOutDTO> retornaTreinosPorTipo(TipoTreino tipoTreino) {
        try (Stream<TreinoEntity> treinoEntityStream = treinoRepository.findAllByTipoTreino(tipoTreino).stream()) {
            return treinoEntityStream
                    .map(TreinoOutDTO::fromEntity)
                    .toList();
        }
    }
}