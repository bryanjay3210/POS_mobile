import 'package:flutter/material.dart';

class OutlinedTextField extends StatefulWidget {
  const OutlinedTextField({Key? key}) : super(key: key);

  @override
  State<OutlinedTextField> createState() => _OutlinedTextFieldState();
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Username'),
      ),
    );
  }
}
