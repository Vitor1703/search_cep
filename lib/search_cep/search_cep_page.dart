import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_cep/components/container.dart';
import 'package:search_cep/components/elevated_button.dart';
import 'package:search_cep/components/scaffold.dart';
import 'package:search_cep/components/search_cep_form.dart';
import 'package:search_cep/components/spacing.dart';
import 'package:search_cep/components/text.dart';
import 'package:search_cep/config/color_config.dart';
import 'package:search_cep/config/icon_config.dart';
import 'package:search_cep/config/size_config.dart';
import 'package:search_cep/config/text_config.dart';
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
          getSpacingHorizontal(spacing: SizeConfig.spacingExtraBig),
          Expanded(child: getText(text: TextConfig.mensagemBuscarCep, color: ColorConfig.white)),
        ],
      ),
    );
  }

  void _buscar() {
    if (_formKey.currentState!.validate()) {
      _searchCepBloc.add(SearchCepLoadEvent(cep: getJustNumbers(_searchCepController.text)));
    }
  }

  Widget _getColumnValue({required String title, required String value}) {
    return getContainer(
      margin: const EdgeInsets.only(bottom: SizeConfig.spacingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getText(text: title, bold: true),
          Padding(
            padding: const EdgeInsets.only(top: SizeConfig.spacingSmall),
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
        _getColumnValue(title: TextConfig.cep, value: searchCepModel.cep),
        _getColumnValue(title: TextConfig.logradouro, value: searchCepModel.logradouro),
        _getColumnValue(title: TextConfig.bairro, value: searchCepModel.bairro),
        _getColumnValue(title: TextConfig.localidade, value: searchCepModel.localidade),
        _getColumnValue(title: TextConfig.uf, value: searchCepModel.uf),
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
        getSpacingVertical(),
        _form(),
        getSpacingVertical(),
        const Divider(thickness: 1),
        getSpacingVertical(),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold(
      titlePage: TextConfig.buscarCep,
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
