abstract class SportStates{}
class InitialState extends SportStates{}

class OnGetSportSuccess extends SportStates {}

class OnGetSportLoading extends SportStates {}

class OnGetSportError extends SportStates {
  final String error;
  OnGetSportError(this.error);
}