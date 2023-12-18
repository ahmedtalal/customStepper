import 'package:flutter/material.dart';

class CustomeButtonWidget extends StatelessWidget {
  const CustomeButtonWidget({
    required this.onClick,
    required this.title,
    required this.buttonDecoration,
    Key? key,
  }) : super(key: key);
  final void Function()? onClick;
  final String title;
  final BoxDecoration buttonDecoration;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        decoration: buttonDecoration,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
