import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_cep/components/container.dart';
import 'package:search_cep/components/elevated_button.dart';
import 'package:search_cep/components/scaffold.dart';
import 'package:search_cep/components/search_cep_form.dart';
import 'package:search_cep/components/text.dart';
import 'package:search_cep/config/color_config.dart';
import 'package:search_cep/config/icon_config.dart';
import 'package:search_cep/config/size_config.dart';
import 'package:search_cep/function/number.dart';
import 'package:search_cep/search_cep/search_cep_bloc.dart';
import 'package:search_cep/search_cep/search_cep_event.dart';
import 'package:search_cep/search_cep/search_cep_model.dart';
import 'package:search_cep/search_cep/search_cep_state.dart';

class SearchCepPage extends StatefulWidget {
  const SearchCepPage({Key? key}) : super(key: key);

  @override
  State<SearchCepPage> createState() => _SearchCepPageState();
}

class _SearchCepPageState extends State<SearchCepPage> {
  final SearchCepBloc _searchCepBloc = SearchCepBloc();

  final TextEditingController _searchCepController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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

  void _buscar() {
    if (_formKey.currentState!.validate()) {
      _searchCepBloc.add(SearchCepLoadEvent(cep: getJustNumbers(_searchCepController.text)));
    } else {
      print('Verifique se os dados inseridos estão corretos');
    }
  }

  Widget _getColumnValue({required String title, required String value}) {
    return getContainer(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getText(text: title, bold: true),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: getText(text: value),
          ),
        ],
      ),
    );
  }

  Widget _getInfoCep(SearchCepModel searchCepModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getColumnValue(title: 'CEP', value: searchCepModel.cep),
        _getColumnValue(title: 'Logradouro', value: searchCepModel.logradouro),
        _getColumnValue(title: 'Bairro', value: searchCepModel.bairro),
        _getColumnValue(title: 'Localidade', value: searchCepModel.localidade),
        _getColumnValue(title: 'UF', value: searchCepModel.uf),
      ],
    );
  }

  Widget _builderInfoCep() {
    return BlocBuilder<SearchCepBloc, SearchCepState>(
      bloc: _searchCepBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SearchCepSuccessState:
            return _getInfoCep(state.searchCepModel);

          case SearchCepErrorState:
            return Container();

          default:
            return Container();
        }
      },
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
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
        const SizedBox(height: 10),
        const Divider(thickness: 1),
        const SizedBox(height: 10),
        _builderInfoCep(),
      ],
    );
  }

  Widget _getButtonBuscar() {
    return BlocBuilder(
      bloc: _searchCepBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(SizeConfig.spacingDefault),
          child: getButtonSearchCep(
            onPressed: () => _buscar(),
            isLoading: state.runtimeType == SearchCepLoadingState,
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold(
      titlePage: 'Buscar CEP',
      body: _body(),
      bottom: _getButtonBuscar(),
    );
  }

  @override
  void dispose() {
    _searchCepBloc.close();
    _searchCepController.dispose();

    super.dispose();
  }
}
