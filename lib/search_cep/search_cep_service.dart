import 'package:http/http.dart' as http;
import 'package:search_cep/search_cep/search_cep_model.dart';

Future<SearchCepModel> buscarCep(String cep) async {
  final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

  return SearchCepModel.fromJson(response.body);
}
