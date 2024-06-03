import 'package:flutter/material.dart';
import './input.dart';
import '../constants/validation.dart';
import '../helpers/validations.dart';

class Validation {
  String label = '';
  bool isValid = false;
  Function(String val) validate;

  Validation(this.label, this.isValid, this.validate);
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    this.isError = false,
    this.errorText,
    this.onChange,
    this.controller,
    this.placeholder = '',
    this.suffixIcon,
    this.isSubmitted = false,
    this.padding = EdgeInsets.zero,
  });

  final bool isSubmitted;
  final Widget? suffixIcon;
  final String placeholder;
  final EdgeInsets padding;
  final bool isError;
  final String? errorText;
  final void Function(String val)? onChange;
  final TextEditingController? controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isVisible = false;
  final List<Validation> _validationRules = [
    Validation('Minimum length - $MIN_LENGTH_NUMBER characters', false,
        validateMinLength),
    Validation('Maximum length - $MAX_LENGTH_NUMBER characters', true,
        validateMaxLength),
    Validation('Must contain at least 1 uppercase letter', false,
        validateOneUppercaseLetter),
    Validation('Must contain at least 1 digit', false, validateOneDigit),
  ];

  void _setIsVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _validatePassword(String password) {
    if (widget.onChange != null) widget.onChange!(password);

    setState(() {
      _validationRules.forEach((rule) {
        rule.isValid = rule.validate(password);
      });
    });
  }

  Color _getColor(bool condition) {
    if (widget.controller!.text.isEmpty) {
      return const Color(0xff4A4E71);
    }

    return condition ? const Color(0xff27B274) : const Color(0xffFF8080);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Input(
          padding: widget.padding,
          isError: widget.isError,
          obscureText: !_isVisible,
          onChange: _validatePassword,
          errorText: widget.errorText,
          controller: widget.controller,
          isSubmitted: widget.isSubmitted,
          placeholder: widget.placeholder,
          suffixIcon: IconButton(
            icon: Icon(
              _isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _setIsVisible,
          ),
        ),
        if (widget.isError == false)
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._validationRules.map((rule) {
                  return Text(
                    rule.label,
                    style: TextStyle(color: _getColor(rule.isValid)),
                  );
                })
              ],
            ),
          )
      ],
    );
  }
}
