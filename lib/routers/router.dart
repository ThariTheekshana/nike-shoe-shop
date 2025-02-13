// routers/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:nike/screens/cart_screen.dart';
import 'package:nike/screens/checkout_screen.dart';
import 'package:nike/screens/drawer_screen.dart';
import 'package:nike/screens/edit_profile_screen.dart';
import 'package:nike/screens/favorite_screen.dart';
import 'package:nike/screens/forgot_password_screen.dart';
import 'package:nike/screens/intro_screens/intro_page1.dart';
import 'package:nike/screens/intro_screens/intro_page2.dart';
import 'package:nike/screens/intro_screens/intro_page3.dart';
import 'package:nike/screens/notification_screen.dart';
import 'package:nike/screens/onboard_screen.dart';
import 'package:nike/screens/orders_screen.dart';
import 'package:nike/screens/profile_screen.dart';
import 'package:nike/screens/register_page.dart';
import 'package:nike/screens/setting_screen.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: '/home', routes: [
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
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/drawer',
      builder: (context, state) => const CustomDrawer(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoriteScreen(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: '/editProfile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/myCart',
      builder: (context, state) => const CheckoutScreen(),
    ),
  ]);
}
