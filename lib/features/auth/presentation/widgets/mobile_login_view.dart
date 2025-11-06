import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olly_weather_app/common/app_button.dart';
import 'package:olly_weather_app/common/app_textfield.dart';
import 'package:olly_weather_app/core/extensions/context_extensions.dart';
import 'package:olly_weather_app/core/extensions/navigation_extensions.dart';
import 'package:olly_weather_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:olly_weather_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:olly_weather_app/features/home/presentation/pages/home_page.dart';

class MobileLoginView extends StatefulWidget {
  const MobileLoginView({super.key});

  @override
  State<MobileLoginView> createState() => _MobileLoginViewState();
}

class _MobileLoginViewState extends State<MobileLoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Welcome Back'),
        AppTextField(hintText: 'Enter your email', controller: emailController),
        AppTextField(
          hintText: 'Enter your password',
          controller: passwordController,
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
              onPressed: () {
                final bloc = context.read<AuthCubit>();
                bloc.login(emailController.text, passwordController.text);
              },
            );
          },
        ),
        const Spacer(),
        TextButton(onPressed: () {}, child: const Text('Forgot password?')),
        TextButton(onPressed: () {}, child: const Text('Sign up')),
      ],
    );
  }
}
