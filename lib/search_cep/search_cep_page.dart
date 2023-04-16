import 'package:flutter/material.dart';
import 'package:search_cep/components/container.dart';
import 'package:search_cep/components/elevated_button.dart';
import 'package:search_cep/components/scaffold.dart';
import 'package:search_cep/components/search_cep_form.dart';
import 'package:search_cep/components/text.dart';
import 'package:search_cep/config/color_config.dart';
import 'package:search_cep/config/icon_config.dart';
import 'package:search_cep/config/size_config.dart';

class SearchCepPage extends StatefulWidget {
  const SearchCepPage({Key? key}) : super(key: key);

  @override
  State<SearchCepPage> createState() => _SearchCepPageState();
}

class _SearchCepPageState extends State<SearchCepPage> {
  final TextEditingController _searchCepController = TextEditingController();

  Widget getWarningSearch() {
    return getContainer(
      backgroundColor: ColorConfig.containerSearchCep,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(IconConfig.search, size: 50, color: ColorConfig.white),
          const SizedBox(width: 20),
          Expanded(
            child: getText(text: 'Por favor, insira seu CEP para que possamos realizar a busca.', color: ColorConfig.white),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Form(
      child: getSearchCepForm(controller: _searchCepController),
    );
  }

  Widget _body() {
    return ListView(
      padding: const EdgeInsets.all(SizeConfig.spacingDefault),
      children: [
        getWarningSearch(),
        const SizedBox(height: 10),
        _form(),
        const SizedBox(height: 20),
        getButtonSearchCep(onPressed: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold(
      titlePage: 'Buscar CEP',
      body: _body(),
    );
  }
}
