import 'package:flutter/material.dart';
import '../../../../../../app/content/helpers/form_helper.dart';
import '../../../../../../app/content/helpers/validator_helper.dart';
import '../../../../../../app/content/setup/fields_key.dart';
import '../../../../../../app/ui/ui.dart';

class WorkerUidInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const WorkerUidInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.uid,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('uidField'),
      label: 'Código del Trabajador',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
