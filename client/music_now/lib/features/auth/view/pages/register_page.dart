import 'package:flutter/material.dart';
import 'package:music_now/core/theme/app_pallete.dart';
import 'package:music_now/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:music_now/features/auth/view/widgets/custom_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomField(
                hintText: ' Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                hintText: ' Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                hintText: ' Password',
                controller: passwordController,
                isobscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              const AuthGradientButton(),
              const SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  children: const [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: AppPalette.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
