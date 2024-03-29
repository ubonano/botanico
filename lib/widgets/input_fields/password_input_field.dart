import 'package:flutter/material.dart';
import '../../../utils/validator.dart';
import 'custom_input_field.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool required;
  final Function? onFieldSubmitted;

  const PasswordInputField({
    Key? key,
    required this.controller,
    this.obscureText = true,
    this.required = true,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Contraseña',
      controller: controller,
      obscureText: obscureText,
      validator: (value) => Validator.password(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}
