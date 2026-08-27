package com.ideau.API.model;

import com.ideau.API.CategoriasTreino;
import com.ideau.API.enums.TipoTreino;
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

    @Column(nullable = false, length = 100)
    String nome;

    @Column(nullable = false)
    UsuarioEntity aluno; //ajustar, adicionar relacionamento

    @Column(nullable = false)
    UsuarioEntity professor; //ajustar, adicionar relacionamento

    @Column(nullable = false)
    CategoriasTreino categoria;

    @Column(nullable = false)
    TipoTreino tipoTreino;
}
