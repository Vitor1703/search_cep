import 'package:search_cep/config/text_config.dart';

String getJustNumbers(String? value) {
  return (value ?? TextConfig.vazio).replaceAll(RegExp('[^0-9]'), TextConfig.vazio);
}
