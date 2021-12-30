abstract class ScienceStates{}
class InitialState extends ScienceStates{}

class OnGetScienceSuccess extends ScienceStates {}

class OnGetScienceLoading extends ScienceStates {}

class OnGetScienceError extends ScienceStates {
  final String error;
  OnGetScienceError(this.error);
}