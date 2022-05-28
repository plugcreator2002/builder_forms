import "package:flutter/material.dart";
import 'package:forms_builder/components/utils/form-builder/src/form_builder_field.dart';

class FormBuilderCustom<T> extends FormBuilderField<T> {
  final T? data;
  final Widget Function(StateBuilder<T> stateBuilder) childFeild;

  FormBuilderCustom({
    Key? key,
    this.data,
    required this.childFeild,
    required String name,
    FormFieldValidator<T>? validator,
    bool readOnly = false,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<T?>? onChanged,
    ValueTransformer<T?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<T>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
  }) : super(
          key: key,
          initialValue: data,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autoValidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          decoration: decoration,
          focusNode: focusNode,
          builder: (fieldState) => childFeild(fieldState as StateBuilder<T>),
        );

  @override
  // ignore: library_private_types_in_public_api
  StateBuilder<T> createState() => StateBuilder<T>();
}

class StateBuilder<T> extends FormBuilderFieldState<FormBuilderCustom<T>, T> {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
