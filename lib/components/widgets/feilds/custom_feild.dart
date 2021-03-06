import 'package:flutter/material.dart';
import 'package:forms_builder/components/utils/form-builder/src/fields/form_builder_custom.dart';

enum WidgetType { input, other }

/// CustomFeild<String>(
///   name: 'four',
///   data: initialData,
///   validator: FormValidators.required(context),
///   child: (state) {
///     return InkWell(
///       onTap: () {
///         initialData = "ali";
///         state.didChange("four");
///       },
///       child: Text(state.isValid.toString()),
///     );
///   },
/// ),

/// u must fill in the field data [T]
class CustomFeild<T> extends StatelessWidget {
  final WidgetType widgetType;
  final String name;

  /// u can customize the body of the widget by changing [decoration]
  final InputDecoration decoration;

  /// ur initial [data]
  final T data;

  /// when u changed data, [onChanged] called
  final void Function(T? data)? onChanged;
  final String? Function(T? data)? validator;

  /// Define any widget you want to validate in Child
  final Widget Function(StateBuilder<T>) child;
  const CustomFeild({
    Key? key,
    required this.name,
    required this.data,
    this.onChanged,
    this.validator,
    required this.child,
    this.widgetType = WidgetType.other,
    this.decoration = const InputDecoration(border: InputBorder.none),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCustom<T>(
      name: name,
      data: data,
      decoration: decoration,
      onChanged: onChanged,
      validator: validator,

      /// when u want change the value
      /// u have too call [state.didChange(new data)] in [childFeild] function
      childFeild: (state) {
        /// if in ur widget has no [InputDecorator]
        /// we call [InputDecorator]
        if (widgetType == WidgetType.other) {
          return InputDecorator(
            decoration: state.decoration,
            child: child(state),
          );
        }
        return child(state);
      },
    );
  }
}
