import 'dart:convert';

class SearchCepModel {
  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;

  SearchCepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory SearchCepModel.empty() {
    return SearchCepModel(
      cep: '',
      logradouro: '',
      bairro: '',
      localidade: '',
      uf: '',
    );
  }

  factory SearchCepModel.fromMap(Map<String, dynamic> map) {
    return SearchCepModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      bairro: map['bairro'],
      localidade: map['localidade'],
      uf: map['uf'],
    );
  }

  factory SearchCepModel.fromJson(String source) => SearchCepModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  String toJson() => json.encode(toMap());
}
