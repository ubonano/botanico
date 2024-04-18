import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

class DNIInputField extends StatelessWidget {
  final FormController pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const DNIInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.dni,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('dniField'),
      label: 'DNI',
      controller: pageController.getFieldController(fieldName)!,
      keyboardType: TextInputType.phone,
      validator: (value) => Validator.number(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}
