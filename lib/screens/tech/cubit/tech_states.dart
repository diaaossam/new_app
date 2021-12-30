abstract class TechStates{}
class InitialState extends TechStates{}

class OnGetTechSuccess extends TechStates {}

class OnGetTechLoading extends TechStates {}

class OnGetTechError extends TechStates {
  final String error;
  OnGetTechError(this.error);
}