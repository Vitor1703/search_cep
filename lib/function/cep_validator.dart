import 'package:search_cep/config/text_config.dart';
import 'package:search_cep/function/number.dart';

String? cepValidator(String cep) {
  cep = getJustNumbers(cep);

  if (cep.length != 8) {
    return TextConfig.cepInvalido;
  }

  return null;
}
