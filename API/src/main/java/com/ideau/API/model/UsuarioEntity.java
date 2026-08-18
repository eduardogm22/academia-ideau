package com.ideau.API.model;

import com.ideau.API.enums.Cargos;
import jakarta.persistence.*;

@Entity
public class UsuarioEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;

    @Column(nullable = false)
    String nome;

    @Column
    String email;

    @Column(nullable = false)
    Cargos cargo;

    @Column(nullable = false)
    String empresa;

    @Column
    String setor;

    @Column(nullable = false, unique = true)
    String username;

    @Column(nullable = false)
    String senha;
}