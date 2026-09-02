package com.ideau.API.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SetorEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "setor_id")
    String id;

    @Column(nullable = false)
    String nome;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresaEntity_id", nullable = false)
    EmpresaEntity empresaEntity;

    @OneToMany(
            mappedBy = "setor",
            fetch = FetchType.LAZY
    )
    private List<UsuarioEntity> funcionarios;

    public SetorEntity(String nome, EmpresaEntity empresaEntity) {
        this.nome = nome;
        this.empresaEntity = empresaEntity;
    }
}
