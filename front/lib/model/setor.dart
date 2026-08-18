import 'empresa.dart';

class Setor {
  String? id;
  String nome;
  Empresa empresa;

  Setor({
    this.id,
    required this.nome,
    required this.empresa
  });

  factory Setor.fromJSON(Map<String, dynamic> json) {
    return Setor(
        id: json['id'],
        nome: json['nome'],
        empresa: json['empresa'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    json['empresa'] = empresa;
    return json;
  }
}