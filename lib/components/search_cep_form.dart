import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:search_cep/components/container.dart';
import 'package:search_cep/config/color_config.dart';
import 'package:search_cep/config/size_config.dart';
import 'package:search_cep/config/text_config.dart';
import 'package:search_cep/function/cep_validator.dart';

Widget getSearchCepForm({required TextEditingController controller}) {
  return getContainer(
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: '00000-000',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.spacingBig, vertical: SizeConfig.spacingDefault),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: SizeConfig.fontsizeExtraBig, fontWeight: FontWeight.bold, color: ColorConfig.black),
      inputFormatters: [MaskTextInputFormatter(mask: "#####-###")],
      validator: (value) => cepValidator(value ?? TextConfig.vazio),
    ),
  );
}
