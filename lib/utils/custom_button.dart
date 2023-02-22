import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback function;
  final double height;
  final double width;
  const CustomButton({Key? key, required this.function, required this.text, required this.height, required this.width}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: widget.function,
        child: Text(widget.text),
      ),
    );
  }
}
