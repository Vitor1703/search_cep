import 'package:flutter/material.dart';
import 'package:search_cep/config/size_config.dart';

Text getText({
  required String text,
  bool? bold,
  double? fontSize,
  Color? color,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize ?? SizeConfig.fontsizeDefault,
      color: color,
      fontWeight: bold ?? false ? FontWeight.bold : null,
    ),
  );
}
