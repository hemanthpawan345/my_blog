import 'package:flutter/material.dart';
import 'package:my_blog/core/theme/app_pallete.dart';
import 'package:my_blog/features/auth/presentation/pages/signup_page.dart';
import 'package:my_blog/features/auth/presentation/widgets/auth_field.dart';
import 'package:my_blog/features/auth/presentation/widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sign In..',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),

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
                buttonText: "Sign In",
                onPressed: () {},
              ),

              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign Up",
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
