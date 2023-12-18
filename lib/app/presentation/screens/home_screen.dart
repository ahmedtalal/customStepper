import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rendering_ui/app/presentation/bloc/stepper_bloc.dart';
import 'package:rendering_ui/app/presentation/bloc/stepper_states.dart';
import 'package:rendering_ui/app/presentation/helpers/home_screen_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeScreenHelper.instance().getWidgetJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        child:
            BlocBuilder<StepperBloc, StepperStates>(builder: (context, state) {
          return Column(
            children: HomeScreenHelper.instance().generataUi(context: context),
          );
        }),
      ),
    ));
  }
}
