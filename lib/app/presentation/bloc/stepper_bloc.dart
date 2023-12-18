import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rendering_ui/app/presentation/bloc/stepper_events.dart';
import 'package:rendering_ui/app/presentation/bloc/stepper_states.dart';

class StepperBloc extends Bloc<StepperEvents, StepperStates> {
  StepperBloc() : super(InitialStepperState()) {
    on<NextStepEvent>(nextStepRequest);
    on<PreviousStepEvent>(previousStepRequest);
  }

  int currentStep = 0;

  FutureOr<void> nextStepRequest(
      NextStepEvent event, Emitter<StepperStates> emit) {
    if (currentStep < 5) {
      currentStep++;
    }
    emit(UpdatedStepperState(currentStep));
  }

  FutureOr<void> previousStepRequest(
      PreviousStepEvent event, Emitter<StepperStates> emit) {
    if (currentStep > 0) {
      currentStep--;
    }
    emit(UpdatedStepperState(currentStep));
  }
}
