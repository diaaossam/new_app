abstract class SearchStates{}
class InitialState extends SearchStates{}

class OnGetSearchSuccess extends SearchStates {}

class OnGetSearchLoading extends SearchStates {}

class OnGetSearchError extends SearchStates {
  final String error;
  OnGetSearchError(this.error);
}