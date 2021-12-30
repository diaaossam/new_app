abstract class HealthStates{}
class InitialState extends HealthStates{}

class OnGetHealthSuccess extends HealthStates {}

class OnGetHealthLoading extends HealthStates {}

class OnGetHealthError extends HealthStates {
  final String error;
  OnGetHealthError(this.error);
}