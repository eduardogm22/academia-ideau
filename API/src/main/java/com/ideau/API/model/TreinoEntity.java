package com.ideau.API.model;

import com.ideau.API.CategoriasTreino;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class TreinoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;

    @Column(nullable = false)
    UsuarioEntity aluno;

    @Column(nullable = false)
    UsuarioEntity professor;

    @Column(nullable = false, length = 100)
    String nome;

    @Column(nullable = false)
    CategoriasTreino categoria;
}
