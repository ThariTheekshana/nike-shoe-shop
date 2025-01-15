// routers/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nike/screens/forgot_password_screen.dart';
import 'package:nike/screens/intro_screens/intro_page1.dart';
import 'package:nike/screens/intro_screens/intro_page2.dart';
import 'package:nike/screens/intro_screens/intro_page3.dart';
import 'package:nike/screens/onboard_screen.dart';
import 'package:nike/screens/register_page.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(initialLocation: '/Spalsh', routes: [
    GoRoute(
      path: '/Spalsh',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: '/intro1',
      builder: (context, state) => const IntroPage1(),
    ),
    GoRoute(
      path: '/intro2',
      builder: (context, state) => const IntroPage2(),
    ),
    GoRoute(
      path: '/intro3',
      builder: (context, state) => const IntroPage3(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/forgot',
      builder: (Context, state) => const ForgotPasswordScreen(),
    )
  ]);
}
