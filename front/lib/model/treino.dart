import 'package:front/model/usuario.dart';
import 'package:front/view/treinos_page.dart';

class Treino {
  String? id;
  String nome;
  Usuario aluno;
  Usuario professor;
  TipoTreino tipoTreino;

  Treino({
    this.id,
    required this.nome,
    required this.aluno,
    required this.professor,
    required this.tipoTreino
  });
  factory Treino.fromJSON(Map<String, dynamic> json) {
    return Treino(
      id: json['id'],
      nome: json['nome'],
      aluno: json['aluno'],
      professor: json['professor'],
      tipoTreino: json['tipoTreino'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    json['aluno'] = aluno;
    json['professor'] = professor;
    json['tipoTreino'] = tipoTreino;
    return json;
  }
}