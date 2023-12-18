import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rendering_ui/app/presentation/bloc/stepper_bloc.dart';
import 'package:rendering_ui/app/presentation/bloc/stepper_states.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    required this.steps,
    super.key,
  });

  final List<dynamic> steps;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: BlocBuilder<StepperBloc, StepperStates>(
        builder: (context, state) {
          if (state is UpdatedStepperState) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  steps.length,
                  (index) => CircleIndicator(
                    label: '${index + 1}',
                    isActive: index <= state.currentStep,
                    title: steps[index]['label'].toString(),
                  ),
                ),
              ),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                steps.length,
                (index) => CircleIndicator(
                  label: '${index + 1}',
                  isActive: index <= 0,
                  title: steps[index]['label'].toString(),
                ),
              ),
            ),
          ); // Initial state, you can customize this part
        },
      ),
    );
  }
}

class CircleIndicator extends StatelessWidget {
  final String label, title;
  final bool isActive;
  const CircleIndicator({
    required this.label,
    required this.title,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.blue : Colors.grey,
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
