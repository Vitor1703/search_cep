import 'package:flutter/material.dart';
import 'package:search_cep/components/text.dart';
import 'package:search_cep/config/color_config.dart';
import 'package:search_cep/config/size_config.dart';

Scaffold getScaffold({
  required String titlePage,
  required Widget body,
  Widget? bottom,
}) {
  return Scaffold(
    appBar: AppBar(
      title: getText(
        text: titlePage.toUpperCase(),
        bold: true,
        color: ColorConfig.black,
        fontSize: SizeConfig.fontsizeBig,
      ),
      centerTitle: true,
    ),
    body: body,
    floatingActionButton: bottom,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}
