package com.ideau.API.repository;

import com.ideau.API.model.EmpresaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpresaRepository extends JpaRepository<EmpresaEntity, String> {
}
