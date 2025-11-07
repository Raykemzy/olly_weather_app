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
import 'package:olly_weather_app/features/auth/presentation/pages/login_page.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool isEnabled = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => isPasswordVisible = !isPasswordVisible);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible);
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
              'Create Account',
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
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            AppTextField(
              hintText: 'Confirm your password',
              controller: confirmPasswordController,
              validator: Validators.notEmpty(),
              obscureText: !isConfirmPasswordVisible,
              suffixIcon: IconButton(
                onPressed: _toggleConfirmPasswordVisibility,
                icon: Icon(
                  isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.push(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else if (state is AuthError) {
                  context.showSnackBar(state.message);
                }
              },
              builder: (context, state) {
                return AppButton(
                  text: 'Sign Up',
                  isEnabled: isEnabled,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    final bloc = context.read<AuthCubit>();
                    bloc.signup(emailController.text, passwordController.text);
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: AppTextStyles.s14w400.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: ' Sign in',
                    style: AppTextStyles.s14w400.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
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
