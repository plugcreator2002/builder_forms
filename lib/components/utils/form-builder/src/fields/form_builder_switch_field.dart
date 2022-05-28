// import "package:flutter/material.dart";
// import "package:sanar/common/config/colors.dart";
// import "package:sanar/common/ui/sizing_information.dart";
// import "package:sanar/utils/form-builder/src/widgets/switch.dart";
// import "package:sanar/widgets/form-fields/minors-widgets/button.dart";
// import "package:sanar/widgets/form-fields/minors-widgets/line.dart";
// import "package:sanar/widgets/form-fields/minors-widgets/title.dart";

// import "../../index.dart";

// class FormBuilderSwitchField<T extends Object> extends FormBuilderField<T> {
//   final SwitchButtonOptions firstValues;
//   final TitleOptions? titleOptions;
//   final SwitchButtonOptions latterValues;
//   final ThemeDataConfig theme;
//   final bool line;

//   FormBuilderSwitchField({
//     final Key? key,
//     this.titleOptions,
//     this.line = true,
//     required this.theme,
//     required String name,
//     required this.firstValues,
//     required this.latterValues,
//     FormFieldValidator<T>? validator,
//     String? initialValue,
//     InputDecoration decoration = const InputDecoration(),
//     ValueChanged<T?>? onChanged,
//     ValueTransformer<T?>? valueTransformer,
//     bool enabled = true,
//     FormFieldSetter<T>? onSaved,
//     AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
//     VoidCallback? onReset,
//     FocusNode? focusNode,
//   }) : super(
//           key: key,
//           initialValue: (initialValue ?? "") as T,
//           name: name,
//           validator: validator,
//           valueTransformer: valueTransformer,
//           onChanged: onChanged,
//           autoValidateMode: autovalidateMode,
//           onSaved: onSaved,
//           enabled: enabled,
//           onReset: onReset,
//           decoration: decoration,
//           focusNode: focusNode,
//           builder: (FormFieldState<T?> field) {
//             final state = field as _FormBuilderSwitchFieldState<T>;

//             return InputDecorator(
//               decoration: state.decoration,
//               child: SwitchField(
//                 onChanged: (val) => state.didChange(val as T),
//                 theme: theme,
//                 firstValues: firstValues,
//                 latterValues: latterValues,
//                 initialValue: initialValue,
//               ),
//             );
//           },
//         );

//   @override
//   _FormBuilderSwitchFieldState<T> createState() {
//     return _FormBuilderSwitchFieldState();
//   }
// }

// class _FormBuilderSwitchFieldState<T extends Object>
//     extends FormBuilderFieldState<FormBuilderSwitchField<T>, T> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (widget.titleOptions != null)
//           TitleFieldView(
//             options: widget.titleOptions!,
//             isValid: isValidate,
//             controller: shaker,
//             name: widget.name,
//           ),
//         Padding(
//           padding: EdgeInsets.all(1.3.wt()),
//           child: super.build(context),
//         ),
//         if (widget.line) Line(theme: widget.theme),
//       ],
//     );
//   }
// }
