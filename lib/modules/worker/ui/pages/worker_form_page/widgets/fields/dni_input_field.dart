import 'package:flutter/material.dart';
import '../../../../../../app/content/helpers/form_helper.dart';
import '../../../../../../app/content/helpers/validator_helper.dart';
import '../../../../../../app/content/setup/fields_key.dart';
import '../../../../../../app/ui/ui.dart';

class DNIInputField extends StatelessWidget {
  final FormHelper pageController;
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
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.number,
      validator: (value) => ValidatorHelper.integer(value, required: required),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
