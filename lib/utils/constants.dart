import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_beta/screens/main/notifications_screen.dart';
import 'package:pretium_beta/screens/main/transactions_screen.dart';
import 'package:pretium_beta/utils/color_from_hex.dart';

import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/pin_creation_screen.dart';
import '../screens/auth/reset_password_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/intro/onboarding_screen.dart';
import '../screens/main/fund_account_screen.dart';
import '../screens/main/home_screen.dart';
import '../screens/main/main_screen.dart';

class Constants {
  static Color backgroundColor = colorFromHex("#15645e");
  static String terms = "https://pretium.africa/term-of-use";
  final List<GetPage<dynamic>> screenRoutes = [
    GetPage(name: '/on_boarding', page: () => OnBoardingScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/signup', page: () => SignupScreen()),
    GetPage(name: '/forgot_password', page: () => ForgotPasswordScreen()),
    GetPage(name: '/reset_password', page: () => ResetPasswordScreen()),
    GetPage(name: '/pin_creation', page: () => PinCreationScreen()),
    GetPage(name: '/main', page: () => MainScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/fund_account', page: () => FundAccountScreen()),
    GetPage(name: '/transactions', page: () => TransactionsScreen()),
    GetPage(name: '/notifications', page: () => NotificationsScreen()),
  ];
}
