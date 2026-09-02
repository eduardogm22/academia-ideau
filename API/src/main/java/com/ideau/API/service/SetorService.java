package com.ideau.API.service;

import com.ideau.API.dto.SetorInDTO;
import com.ideau.API.dto.SetorOutDTO;
import com.ideau.API.model.EmpresaEntity;
import com.ideau.API.model.SetorEntity;
import com.ideau.API.repository.EmpresaRepository;
import com.ideau.API.repository.SetorRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

@Service
public class SetorService {
    private final SetorRepository setorRepository;
    private final EmpresaService empresaService;

    public SetorService(SetorRepository setorRepository, EmpresaService empresaService) {
        this.setorRepository = setorRepository;
        this.empresaService = empresaService;
    }

    public SetorEntity cadastra(SetorInDTO setorInDTO) {
        EmpresaEntity empresaEntity = empresaService.retornaPorId(setorInDTO.empresa_id());

        SetorEntity setorEntity = new SetorEntity(
                setorInDTO.nome(),
                empresaEntity
        );
        setorRepository.save(setorEntity);

        return setorEntity;
    }
    public SetorEntity retornaPorId(String id) {
        SetorEntity setorEntity = setorRepository.findById(id).orElse(null);

        if (setorEntity == null) {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND);
        }
        return setorEntity;
    }
}
