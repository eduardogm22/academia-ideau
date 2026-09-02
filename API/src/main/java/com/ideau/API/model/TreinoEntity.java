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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "aluno_id", nullable = false)
    UsuarioEntity aluno;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "professor_id", nullable = false)
    UsuarioEntity professor;

    @Column(nullable = false)
    CategoriasTreino categoria;

    @Column(nullable = false)
    TipoTreino tipoTreino;

    public TreinoEntity(String nome, UsuarioEntity aluno, UsuarioEntity professor, CategoriasTreino categoria, TipoTreino tipoTreino) {
        this.nome = nome;
        this.aluno = aluno;
        this.professor = professor;
        this.categoria = categoria;
        this.tipoTreino = tipoTreino;
    }
}
