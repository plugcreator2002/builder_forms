import 'package:flutter/material.dart';
import 'package:forms_builder/components/utils/form-builder/index.dart';
import 'package:forms_builder/components/widgets/feilds/custom_feild.dart';
import 'package:forms_builder/components/widgets/feilds/input_feild.dart';
import 'package:forms_builder/components/widgets/feilds/radio_field.dart';
import 'package:forms_builder/components/controllers/shake_controller.dart';
import 'package:forms_builder/components/widgets/feilds_title.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final shaker = ShakeController();
  final _stateKey = GlobalKey<FormBuilderState>();
  String one = "";
  String tow = "";
  String four = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Room',
      home: Scaffold(
        body: FormBuilder(
          key: _stateKey,
          shakeController: shaker,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              const SizedBox(height: 100),
              InputFeild(
                name: "one",
                data: one,
                validator: FormValidators.required(context),
                feildTitle: FieldsTitle(
                  title: "soale 1",
                ),
              ),
              const SizedBox(height: 15),
              InputFeild(
                name: "tow",
                data: tow,
                validator: FormValidators.integer(context),
                feildTitle: FieldsTitle(
                  title: "soale 2",
                ),
              ),
              const SizedBox(height: 15),
              RadioField<String>(
                name: "three",
                validator: FormValidators.required(context),
                feildTitle: FieldsTitle(
                  title: "soale 3",
                ),
                items: const [
                  RadioModel(
                    code: "1",
                    label: "one",
                  ),
                  RadioModel(
                    code: "2",
                    label: "tow",
                  ),
                  RadioModel(
                    code: "3",
                    label: "three",
                  ),
                ],
              ),
              CustomFeild(
                name: "four",
                data: four,
                widgetType: WidgetType.input,
                child: (state) {
                  return TextField(
                    decoration: state.decoration,
                  );
                },
              ),
              const SizedBox(height: 100),
              // ignore: deprecated_member_use
              GestureDetector(
                onTap: () => shaker.validateShaker(_stateKey),
                child: const CircleAvatar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
