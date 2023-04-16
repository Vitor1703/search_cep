import 'package:flutter/material.dart';
import 'package:search_cep/config/size_config.dart';

import '../config/color_config.dart';

Widget getContainer({
  double? width,
  double? height,
  Color? backgroundColor,
  Widget? child,
}) {
  return Builder(
    builder: (context) => Container(
      width: width ?? SizeConfig.maxWidthPage(context),
      height: height,
      padding: const EdgeInsets.all(SizeConfig.spacingDefault),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorConfig.lightGrey,
        borderRadius: BorderRadius.circular(SizeConfig.radiusDefault),
      ),
      child: child,
    ),
  );
}
