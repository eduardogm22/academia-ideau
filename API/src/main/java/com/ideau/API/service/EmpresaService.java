package com.ideau.API.service;

import com.ideau.API.model.EmpresaEntity;
import com.ideau.API.repository.EmpresaRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

@Service
public class EmpresaService {
    private final EmpresaRepository empresaRepository;

    public EmpresaService(EmpresaRepository empresaRepository) {
        this.empresaRepository = empresaRepository;
    }

    public EmpresaEntity cadastra(EmpresaEntity empresaEntity) {
        empresaEntity.setId(null);
        empresaRepository.save(empresaEntity);
        return empresaEntity;
    }
    public EmpresaEntity retornaPorId(String id) {
        EmpresaEntity empresaEntity = empresaRepository.findById(id).orElse(null);
        if (empresaEntity == null) {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND);
        }
        return empresaEntity;
    }
}