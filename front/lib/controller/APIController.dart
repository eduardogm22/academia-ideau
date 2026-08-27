import 'package:front/model/treino.dart';
import 'package:front/enums/tipo_treino.dart';
import 'package:http/http.dart' as http;

Future<http.Response> httpGet(String url) {
  return http.get(Uri.parse(url));
}

List<Treino> getTreinos(TipoTreino tipoTreino) {
  Future<http.Response> response = httpGet('');
}