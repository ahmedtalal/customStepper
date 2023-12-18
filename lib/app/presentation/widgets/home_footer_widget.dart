import 'package:flutter/material.dart';
import 'package:rendering_ui/app/presentation/widgets/custome_button_widget.dart';

class HomeFooterWidget extends StatelessWidget {
  const HomeFooterWidget({
    required this.data,
    required this.onNextClick,
    required this.onPreviousClick,
    Key? key,
  }) : super(key: key);
  final List<dynamic> data;
  final void Function()? onNextClick;
  final void Function()? onPreviousClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: CustomeButtonWidget(
              onClick: onNextClick,
              title: data[0]["name"],
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[300],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: CustomeButtonWidget(
              onClick: onPreviousClick,
              title: data[1]["name"],
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
