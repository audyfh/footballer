import 'package:flutter/material.dart';
import 'package:footballer/core/theme/app_colors.dart';
import 'package:footballer/features/auth/presentation/widgets/custom_button.dart';
import 'package:footballer/features/auth/presentation/widgets/custom_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usnController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pw2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: AppColors.primary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomField(
                      hint: "Username",
                      controller: usnController,
                      isObscure: false),
                  SizedBox(
                    height: 12,
                  ),
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
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Confirm Password",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomField(
                      hint: "Confirm Password",
                      controller: pw2Controller,
                      isObscure: true)
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  CustomButton(text: "Register", onTap: () {}),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                        'Login',
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
