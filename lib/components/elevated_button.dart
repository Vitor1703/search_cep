import 'package:flutter/material.dart';
import 'package:search_cep/components/text.dart';
import 'package:search_cep/config/size_config.dart';

Widget getButtonSearchCep({required void Function() onPressed}) {
  return Builder(
    builder: (context) => ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(SizeConfig.maxWidthPage(context), 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.radiusDefault)),
      ),
      child: getText(text: 'Buscar', bold: true, fontSize: SizeConfig.fontsizeBig),
    ),
  );
}
