import 'package:search_cep/search_cep/search_cep_model.dart';

abstract class SearchCepState {
  SearchCepModel searchCepModel;

  SearchCepState({required this.searchCepModel});
}

class SearchCepInitialState extends SearchCepState {
  SearchCepInitialState() : super(searchCepModel: SearchCepModel.empty());
}

class SearchCepLoadingState extends SearchCepInitialState {}

class SearchCepSuccessState extends SearchCepState {
  SearchCepSuccessState({required SearchCepModel searchCepModel}) : super(searchCepModel: searchCepModel);
}

class SearchCepErrorState extends SearchCepInitialState {}
