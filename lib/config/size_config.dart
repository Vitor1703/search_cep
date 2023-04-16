import 'package:flutter/cupertino.dart';

class SizeConfig {
  // Spacing
  static const double spacingDefault = 12;

  // Radius
  static const double radiusDefault = 15;

  // Fontsizes
  static const double fontsizeDefault = 16;
  static const double fontsizeBig = 20;
  static const double fontsizeExtraBig = 25;

  // Page sizes
  static double maxWidthPage(BuildContext context) => MediaQuery.of(context).size.width;
  static double maxHeightPage(BuildContext context) => MediaQuery.of(context).size.height;
}