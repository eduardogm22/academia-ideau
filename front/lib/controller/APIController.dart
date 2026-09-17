import 'dart:convert';
import 'package:front/model/treino.dart';
import 'package:front/model/usuario.dart';
import 'package:front/enums/tipo_treino.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://10.0.2.2:8080';

class Session {
  static Usuario? usuario;
}

Future<Usuario> login(String username, String senha) async {
  final url = Uri.parse('$baseUrl/usuario/login?username=$username&senha=$senha');
  final response = await http.post(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(utf8.decode(response.bodyBytes));
    final user = Usuario.fromJSON(data);
    Session.usuario = user;
    return user;
  } else {
    throw Exception('Falha no login: ${response.statusCode}');
  }
}

Future<List<Treino>> getTreinos(String idUsuario, TipoTreino tipo) async {
  final url = Uri.parse('$baseUrl/treino?idUsuario=$idUsuario&tipoTreino=${tipo.name}');
  final response = await http.get(url);
//... rest of the file

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
    return data.map((json) => Treino.fromJSON(json)).toList();
  } else {
    throw Exception('Failed to load treinos');
  }
}