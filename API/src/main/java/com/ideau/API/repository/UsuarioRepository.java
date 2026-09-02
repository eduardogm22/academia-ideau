package com.ideau.API.repository;

import com.ideau.API.model.UsuarioEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<UsuarioEntity, String> {
    public boolean existsByUsername(String username);
}
