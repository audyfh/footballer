import 'package:flutter/material.dart';
import 'package:footballer/core/theme/app_colors.dart';
import 'package:footballer/features/auth/presentation/widgets/custom_button.dart';
import 'package:footballer/features/auth/presentation/widgets/custom_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  "Footballer",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.primary),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomField(
                      hint: "Email",
                      controller: emailController,
                      isObscure: false),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomField(
                      hint: "Password",
                      controller: pwController,
                      isObscure: true),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  CustomButton(text: "Login", onTap: () {}),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Dont have any account? ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
