import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/core/theme/app_pallete.dart';
import 'package:my_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_blog/features/auth/presentation/pages/login_page.dart';
import 'package:my_blog/features/auth/presentation/widgets/auth_field.dart';
import 'package:my_blog/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
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
            children: <Widget>[
              const Text(
                'Sign Up..',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //name field
              const SizedBox(height: 30.0),
              AuthField(hintText: "Name", controller: nameController),

              //email field
              const SizedBox(height: 15.0),
              AuthField(hintText: "Email", controller: emailController),

              //password field
              const SizedBox(height: 15.0),
              AuthField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),

              //singup button
              const SizedBox(height: 20.0),
              AuthGradientButton(
                buttonText: "Sign Up",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignUp(
                            email: emailController.text.trim(),
                            name: nameController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  }
                },
              ),

              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
