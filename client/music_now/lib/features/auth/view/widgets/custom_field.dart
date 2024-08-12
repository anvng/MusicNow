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

        if (widget.hintText.toLowerCase() == "email") {
          // validate
          const emailPattern =
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
          final regex = RegExp(emailPattern);
          if (!regex.hasMatch(value)) {
            return "Please enter a valid email address";
          }
        }
        if (widget.hintText == 'Password' && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      obscureText: widget.isobscureText,
    );
  }
}
