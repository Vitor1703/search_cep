abstract class SearchCepEvent {}

class SearchCepLoadEvent extends SearchCepEvent {
  String cep;

  SearchCepLoadEvent({required this.cep});
}
