import 'package:flutter/material.dart';

enum ValidatorType {
  required,
  num,
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  String? customValidator(String? value, List<ValidatorType> types) {
    if (value == null) return null;

    String error = '';

    for (var type in types) {
      switch (type) {
        case ValidatorType.required:
          if (value.isEmpty) {
            error = 'Please enter value';
          }
        case ValidatorType.num:
          if (num.tryParse(value) == null) {
            error = 'Please enter number';
          }

        default:
      }
    }

    return error.isEmpty ? null : error;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) =>
                    customValidator(value, [ValidatorType.num]),
              )
            ],
          )),
    );
  }
}
