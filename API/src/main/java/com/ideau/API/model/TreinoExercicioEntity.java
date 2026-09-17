package com.ideau.API.model;

import jakarta.persistence.*;

@Entity
public class TreinoExercicioEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "treino_id", nullable = false)
    private TreinoEntity treinoEntity;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "exercicio_id", nullable = false)
    private ExercicioEntity exercicioEntity;

    @Column(nullable = false)
    Integer ordem;

    @Column(nullable = false)
    Integer series;

    @Column(nullable = false)
    Integer repeticoes;

    @Column
    Integer carga;

    @Column
    Integer descansoEmSegundos;
}
