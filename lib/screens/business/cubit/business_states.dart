abstract class BusinessStates {}

class InitialStates extends BusinessStates {}

class OnGetBusinessSuccess extends BusinessStates {}

class OnGetBusinessLoading extends BusinessStates {}

class OnGetBusinessError extends BusinessStates {
  final String error;
  OnGetBusinessError(this.error);
}
