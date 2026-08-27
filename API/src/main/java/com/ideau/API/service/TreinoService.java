package com.ideau.API.service;

import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.TreinoEntity;
import com.ideau.API.repository.TreinoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TreinoService {
    private final TreinoRepository treinoRepository;

    public TreinoService(TreinoRepository treinoRepository) {
        this.treinoRepository = treinoRepository;
    }

    public List<TreinoEntity> retornaTreinosPorTipo(TipoTreino tipoTreino) {
        return treinoRepository.findAllByTipoTreino(tipoTreino);
    }
}
