import 'package:flutter/material.dart';
import 'package:forms_builder/components/controllers/shake_controller.dart';
import 'package:forms_builder/components/widgets/animation/shake_widget.dart';

// ignore: must_be_immutable
class FieldsTitle extends StatelessWidget {
  final ShakeController? controller;
  final String? number;
  final String? title;
  final String? description;
  final Color color;
  final String? name;
  late bool isValid;
  final String fontFamily;

  FieldsTitle({
    final Key? key,
    this.number,
    this.title,
    this.description,
    this.color = Colors.black,
    this.controller,
    final bool? isValid,
    this.name,
    this.fontFamily = "yekan",
  }) : super(key: key) {
    this.isValid = isValid ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ShakeWidget(
        id: name,
        controller: controller,
        child: RichText(
          text: TextSpan(
            text: number ?? "",
            style: TextStyle(
              fontSize: 15,
              fontFamily: fontFamily,
              color: !isValid ? Colors.red[900] : Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: title ?? "",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: fontFamily,
                  color: !isValid ? Colors.red[900] : color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
