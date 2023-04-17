import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:search_cep/config/color_config.dart';

Widget getLoading() {
  return LoadingAnimationWidget.staggeredDotsWave(
    color: ColorConfig.white,
    size: 35,
  );
}
