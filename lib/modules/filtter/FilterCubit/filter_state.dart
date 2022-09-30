

abstract class FilterState {}

class FilterInitial extends FilterState {}
class LoadingStateGetFacilities extends FilterState {}
class SuccessStateGetFacilities extends FilterState {}
class ErrorStateGetFacilities extends FilterState {
  final String error;
  ErrorStateGetFacilities(this.error);
}

class LoadingStateGetSearch extends FilterState {}
class SuccessStateGetSearch extends FilterState {}
class ErrorStateGetSearch extends FilterState {
  final String error;
  ErrorStateGetSearch(this.error);
}
