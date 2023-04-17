import 'package:flutter/cupertino.dart';
import 'package:search_cep/config/size_config.dart';

SizedBox getSpacingVertical({double? spacing}) {
  return SizedBox(height: spacing ?? SizeConfig.spacingDefault);
}

SizedBox getSpacingHorizontal({double? spacing}) {
  return SizedBox(width: spacing ?? SizeConfig.spacingDefault);
}