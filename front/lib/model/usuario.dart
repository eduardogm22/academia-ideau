import 'package:front/enums/cargos.dart';
import 'package:front/model/setor.dart';

class Usuario {
  String? id;
  String nome;
  String? email;
  Cargos cargo;
  Setor setor;

  Usuario({
    this.id,
    required this.nome,
    this.email,
    required this.cargo,
    required this.setor
  });

  factory Usuario.fromJSON(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        cargo: Cargos.values.byName(json['cargo']),
        setor: json['setor']
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    json['email'] = email;
    json['cargo'] = cargo.toString();
    json['setor'] = setor;
    return json;
  }
}