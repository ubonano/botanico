import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class PhoneInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const PhoneInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.phone,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CustomInputField(
          key: key ?? const Key('phoneField'),
          label: 'Teléfono',
          controller: pageController.getFieldController(fieldName)!,
          keyboardType: TextInputType.phone,
          validator: (value) => ValidatorHelper.number(value, required: required),
          onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
          enabled: pageController.isUpdateModeRx.value ? pageController.isFieldsEnabled.value : true,
        );
      },
    );
  }
}
