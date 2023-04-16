import 'package:flutter/material.dart';
import 'package:search_cep/config/color_config.dart';
import 'package:search_cep/search_cep/search_cep_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search CEP',
      theme: ThemeData(
        primaryColor: ColorConfig.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorConfig.primary,
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorConfig.primary,
          secondary: ColorConfig.primary,
        ),
      ),
      home: const SearchCepPage(),
    );
  }
}
