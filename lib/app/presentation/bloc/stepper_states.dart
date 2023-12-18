abstract class StepperStates {}

class InitialStepperState extends StepperStates {}

class UpdatedStepperState extends StepperStates {
  final int currentStep;

  UpdatedStepperState(this.currentStep);
}
