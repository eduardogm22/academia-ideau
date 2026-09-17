package com.ideau.API;

import com.ideau.API.enums.Cargos;
import com.ideau.API.enums.CategoriasTreino;
import com.ideau.API.enums.TipoTreino;
import com.ideau.API.model.EmpresaEntity;
import com.ideau.API.model.SetorEntity;
import com.ideau.API.model.TreinoEntity;
import com.ideau.API.model.UsuarioEntity;
import com.ideau.API.repository.EmpresaRepository;
import com.ideau.API.repository.SetorRepository;
import com.ideau.API.repository.TreinoRepository;
import com.ideau.API.repository.UsuarioRepository;
import com.ideau.API.service.EmpresaService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class ApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiApplication.class, args);
	}

	@Bean
    CommandLineRunner init(
			EmpresaRepository empresaRepository,
			SetorRepository setorRepository,
			UsuarioRepository usuarioRepository,
			TreinoRepository treinoRepository) {
		return args -> {
			EmpresaEntity empresaEntity = new EmpresaEntity();
			empresaEntity.setId(null);
			empresaEntity.setNome("Empresa Teste");
			empresaRepository.save(empresaEntity);

			SetorEntity setorEntity = new SetorEntity("Setor 1 Teste", empresaEntity);
			setorRepository.save(setorEntity);

			UsuarioEntity professor = new UsuarioEntity(
					"professor",
					"edu@rdo.com",
					Cargos.ADMIN,
					setorEntity,
					"prof",
					"prof");
			usuarioRepository.save(professor);

			UsuarioEntity aluno = new UsuarioEntity(
					"aluno",
					"edu@rdo.com",
					Cargos.USUARIO,
					setorEntity,
					"aluno",
					"aluno");
			usuarioRepository.save(aluno);

			TreinoEntity treino = new TreinoEntity(
					"treino 1 teste",
					aluno,
					professor,
					CategoriasTreino.FORCA,
					TipoTreino.ACADEMIA
			);
			treinoRepository.save(treino);
		};
	}

}
