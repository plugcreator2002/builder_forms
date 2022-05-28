import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms_builder/components/controllers/shake_controller.dart';
import 'package:forms_builder/components/utils/form-builder/index.dart';
import 'package:forms_builder/components/widgets/feilds_title.dart';

class InputFeild extends StatefulWidget {
  final String name;
  final String? data;
  final bool enabled, obscureText, line;
  final String? hint;
  final String obscuringCharacter;
  final int? maxLength, maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> formatter;
  final void Function(String? entrance, bool isValid)? onChanged;
  final void Function(String? newValue)? onSaved;
  final void Function(String?)? onSubmitted;
  late final FocusNode node;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final FieldsTitle? feildTitle;
  final TextStyle? style;
  final Widget Function(
    ShakeController? shaker,
    bool isValid,
    Widget child,
  )? builderOnFeild;
  InputFeild({
    Key? key,
    required this.name,
    this.data,
    this.style,
    this.line = false,
    this.enabled = true,
    this.hint,
    this.obscureText = false,
    this.obscuringCharacter = "•",
    this.maxLength,
    this.maxLines,
    this.keyboardType,
    this.formatter = const [],
    this.onChanged,
    this.onSaved,
    this.onSubmitted,
    this.validator,
    this.textInputAction,
    this.builderOnFeild,
    this.decoration,
    this.feildTitle,
  }) : super(key: key) {
    node = FocusNode(debugLabel: name);
  }

  @override
  State<InputFeild> createState() => _InputFeildState();
}

class _InputFeildState extends State<InputFeild> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderInputField(
      name: widget.name,
      initialValue: widget.data,
      validator: widget.validator,
      style: widget.style,
      decoration: [
        widget.decoration ?? const InputDecoration(),
        const InputDecoration(
          counterText: "",
          errorText: null,
          errorMaxLines: null,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          errorStyle: TextStyle(height: 0, fontSize: 0),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ][widget.decoration != null ? 0 : 1],
      builderOnFeild: (shaker, isValid, child) {
        if (widget.builderOnFeild != null) {
          return widget.builderOnFeild!(shaker, isValid, child);
        }
        return Column(
          children: [
            if (widget.feildTitle != null) ...[
              FieldsTitle(
                name: widget.name,
                title: widget.feildTitle?.title,
                isValid: isValid,
                controller: shaker,
              ),
            ],
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: child,
            ),
          ],
        );
      },
    );
  }
}
