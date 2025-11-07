import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/common/app_button.dart';
import 'package:olly_weather_app/common/app_textfield.dart';
import 'package:olly_weather_app/core/extensions/context_extensions.dart';
import 'package:olly_weather_app/core/extensions/navigation_extensions.dart';
import 'package:olly_weather_app/core/utils/app_textstyles.dart';
import 'package:olly_weather_app/core/utils/validators.dart';
import 'package:olly_weather_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:olly_weather_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:olly_weather_app/features/auth/presentation/pages/registration_page.dart';
import 'package:olly_weather_app/features/home/presentation/pages/home_page.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isEnabled = false;
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => isPasswordVisible = !isPasswordVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            isEnabled = _formKey.currentState?.validate() == true;
          });
        },
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: AppTextStyles.s40w800.copyWith(color: Colors.white),
            ),
            AppTextField(
              hintText: 'Enter your email',
              controller: emailController,
              validator: Validators.email(),
            ),
            AppTextField(
              hintText: 'Enter your password',
              controller: passwordController,
              validator: Validators.notEmpty(),
              obscureText: !isPasswordVisible,
              underChild: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: AppTextStyles.s14w400.copyWith(color: Colors.blue),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.push(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else if (state is AuthError) {
                  context.showSnackBar(state.message);
                }
              },
              builder: (context, state) {
                //Add disabled and loading state
                return AppButton(
                  text: 'Login',
                  isEnabled: isEnabled,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    final bloc = context.read<AuthCubit>();
                    bloc.login(emailController.text, passwordController.text);
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Don\'t have an account?',
                    style: AppTextStyles.s14w400.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: ' Sign up',
                    style: AppTextStyles.s14w400.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const RegistrationPage(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
