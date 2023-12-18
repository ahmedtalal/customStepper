import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rendering_ui/app/data/services/local/local_service.dart';
import 'package:rendering_ui/app/presentation/bloc/stepper_events.dart';
import 'package:rendering_ui/app/presentation/widgets/custome_stepper.dart';
import 'package:rendering_ui/app/presentation/widgets/home_footer_widget.dart';

import '../bloc/stepper_bloc.dart';
import '../bloc/stepper_states.dart';

class HomeScreenHelper {
  static HomeScreenHelper? _homeScreenHelper;
  HomeScreenHelper._internal();
  static HomeScreenHelper instance() {
    if (_homeScreenHelper == null) {
      return _homeScreenHelper = HomeScreenHelper._internal();
    }
    return _homeScreenHelper!;
  }

  List<dynamic> widgetJson = [];
  List<Widget> formDataContent = const [
    Text("step1"),
    Text("step1"),
    Text("step1"),
    Text("step1"),
    Text("step1"),
    Text("step1"),
  ];

  getWidgetJson() async {
    widgetJson = LocalService.instance().fetchDynamicWidgetData();
  }

  List<int> stepperSelectedStack = [0];

  List<dynamic> getSteppers() => widgetJson[0]["children"];

  List<dynamic> getFormData() => widgetJson[1]["children"];

  List<dynamic> getFooterData() => widgetJson[2]["children"];

  List<Widget> generataUi({required BuildContext context}) {
    List<Widget> widgetList = [];
    List.generate(widgetJson.length, (index) {
      switch (widgetJson[index]["type"]) {
        case "steps":
          widgetList.add(Expanded(
            flex: 2,
            child: CustomStepper(
              steps: getSteppers(),
            ),
          ));
        case "formData":
          widgetList.add(Expanded(
            flex: 8,
            child: SizedBox(
              child: BlocBuilder<StepperBloc, StepperStates>(
                builder: (context, state) {
                  if (state is UpdatedStepperState) {
                    return Center(
                      child: Text(
                        'Step ${state.currentStep + 1}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      "Step 1",
                      style: TextStyle(fontSize: 20),
                    ),
                  ); // Initial state, you can customize this part
                },
              ),
            ),
          ));
        case "footer":
          widgetList.add(Expanded(
            flex: 1,
            child: HomeFooterWidget(
              data: getFooterData(),
              onNextClick: () {
                context.read<StepperBloc>().add(NextStepEvent());
              },
              onPreviousClick: () {
                context.read<StepperBloc>().add(PreviousStepEvent());
              },
            ),
          ));
        default:
          return Container();
      }
    });
    return widgetList;
  }
}
