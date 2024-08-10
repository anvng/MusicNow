import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isobscureText;
  const CustomField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isobscureText = false});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$widget.hintText is Missing!";
        }
        return null;
      },
      obscureText: widget.isobscureText,
    );
  }
}
