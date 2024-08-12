import 'package:flutter/material.dart';
import 'package:music_now/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  const AuthGradientButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppPalette.gradient1, AppPalette.gradient2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              backgroundColor: AppPalette.gradient2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(buttonText,
                style: const TextStyle(
                    color: AppPalette.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))));
  }
}