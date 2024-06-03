import 'package:flutter/material.dart';

OutlineInputBorder outlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(60.0),
    borderSide: BorderSide(color: borderColor, width: 2.0),
  );
}

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.isError = false,
    this.errorText,
    this.onChange,
    this.controller,
    this.placeholder = '',
    this.suffixIcon,
    this.obscureText = false,
    this.isSubmitted = false,
    this.padding = EdgeInsets.zero,
  });

  final bool isSubmitted;
  final Widget? suffixIcon;
  final String placeholder;
  final EdgeInsets padding;
  final bool isError;
  final String? errorText;
  final bool obscureText;
  final void Function(String val)? onChange;
  final TextEditingController? controller;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  Color getFillColor() {
    if (widget.isSubmitted && !widget.isError) return Color(0x3327B274);
    if (widget.isError) return Color(0x33FF8080);
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        obscuringCharacter: '●',
        onChanged: widget.onChange,
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          filled: true,
          fillColor: getFillColor(),
          errorText: widget.errorText,
          hintText: widget.placeholder,
          suffixIcon: widget.suffixIcon,
          errorStyle: TextStyle(color: Color(0xffFF8080), fontSize: 13),
          enabledBorder: outlineInputBorder(const Color(0x33151D51)),
          focusedBorder: outlineInputBorder(const Color(0xff151D51)),
          errorBorder: outlineInputBorder(const Color(0xffFF8080)),
          focusedErrorBorder: outlineInputBorder(const Color(0xffFF8080)),
          hintStyle: const TextStyle(fontSize: 16, color: Color(0xff151D51)),
          contentPadding: const EdgeInsets.only(
              left: 24.0, right: 24.0, top: 18.0, bottom: 18.0),
        ),
      ),
    );
  }
}
