import 'package:egypttour/routing/routes.dart';
import 'package:egypttour/views/floating_action/floating_action_button.dart';
import 'package:egypttour/views/login_screen/login_screen.dart';
import 'package:egypttour/views/register_screen/data/cubit/sign_up_email_cubit.dart';
import 'package:egypttour/views/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => SignUpEmailCubit(),
              child: const RegisterScreen()),
        );
      case Routes.floatingActionButton:
        return MaterialPageRoute(
          builder: (_) => const FloatingActionButtonScreen()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Routing'),
            ),
          ),
        );
    }
  }
}
