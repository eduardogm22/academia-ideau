import 'package:front/model/usuario.dart';

class Treino {
  String? id;
  String nome;
  Usuario aluno;

  Treino({
    this.id,
    required this.nome,
    required this.aluno,
  });
  //
  // factory Setor.fromJSON(Map<String, dynamic> json) {
  //   return Setor(
  //     id: json['id'],
  //     nome: json['nome'],
  //     empresa: json['empresa'],
  //   );
  // }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> json = <String, dynamic>{};
  //   json['id'] = id;
  //   json['nome'] = nome;
  //   json['empresa'] = empresa;
  //   return json;
  // }
}