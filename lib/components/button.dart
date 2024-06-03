import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.onClick,
    this.name = '',
    this.width = 150.0,
    this.padding = EdgeInsets.zero,
  });

  final double width;
  final String name;
  final EdgeInsets padding;
  final VoidCallback? onClick;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF70C3FF), Color(0xFF4B65FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shadowColor: WidgetStateProperty.all(Colors.transparent),
          ),
          onPressed: widget.onClick,
          child: Text(widget.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
