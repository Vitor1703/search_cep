import 'package:bloc/bloc.dart';
import 'package:search_cep/search_cep/search_cep_event.dart';
import 'package:search_cep/search_cep/search_cep_service.dart';
import 'package:search_cep/search_cep/search_cep_state.dart';

class SearchCepBloc extends Bloc<SearchCepEvent, SearchCepState> {
  SearchCepBloc() : super(SearchCepInitialState()) {
    on<SearchCepLoadEvent>(
      (event, emit) async {
        emit(SearchCepLoadingState());

        try {
          emit(SearchCepSuccessState(searchCepModel: await buscarCep(event.cep)));
        } catch (e) {
          emit(SearchCepErrorState());
        }
      },
    );
  }
}
