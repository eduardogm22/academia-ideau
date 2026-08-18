class Empresa {
  String? id;
  String nome;

  Empresa({
    this.id,
    required this.nome
  });

  factory Empresa.fromJSON(Map<String, dynamic> json) {
    return Empresa(
        id: json['id'],
        nome: json['nome'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    return json;
  }
}