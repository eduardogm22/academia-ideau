import 'package:front/model/usuario.dart';
import 'package:front/enums/tipo_treino.dart';
import 'package:front/enums/categorias_treino.dart';

class Treino {
  String? id;
  String nome;
  Usuario aluno;
  Usuario professor;
  CategoriasTreino categoria;
  TipoTreino tipoTreino;

  Treino({
    this.id,
    required this.nome,
    required this.aluno,
    required this.professor,
    required this.categoria,
    required this.tipoTreino
  });

  factory Treino.fromJSON(Map<String, dynamic> json) {
    return Treino(
      id: json['id'],
      nome: json['nome'],
      aluno: Usuario.fromJSON(json['aluno']),
      professor: Usuario.fromJSON(json['professor']),
      categoria: CategoriasTreino.values.byName(json['categoria']),
      tipoTreino: TipoTreino.values.byName(json['tipoTreino']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    json['aluno'] = aluno.toJson();
    json['professor'] = professor.toJson();
    json['categoria'] = categoria.name;
    json['tipoTreino'] = tipoTreino.name;
    return json;
  }
}