import 'package:flutter/material.dart';
import 'package:music_now/core/theme/theme.dart';
import 'package:music_now/features/auth/view/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Now',
      theme: AppTheme.lightThemeMode,
      home: const RegisterPage(),
    );
  }
}
