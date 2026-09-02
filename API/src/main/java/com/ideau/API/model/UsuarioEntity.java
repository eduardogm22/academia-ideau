package com.ideau.API.model;

import com.ideau.API.enums.Cargos;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "setor_id")
    SetorEntity setor;

    @Column(nullable = false, unique = true)
    String username;

    @Column(nullable = false)
    String senha;

    public UsuarioEntity(String nome, String email, Cargos cargo, SetorEntity setor, String username, String senha) {
        this.nome = nome;
        this.email = email;
        this.cargo = cargo;
        this.setor = setor;
        this.username = username;
        this.senha = senha;
    }
}