package com.ideau.API.repository;

import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.TreinoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TreinoRepository extends JpaRepository<TreinoEntity, String> {
    List<TreinoEntity> findAllByTipoTreino(TipoTreino tipoTreino);
}