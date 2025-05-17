import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/auth_controller.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/sign_up_screen.dart';
import 'screens/hero/onboarding_screen.dart';
import 'screens/main/home_screen.dart';
import 'utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put(AuthController());
  runApp(const MyApp());
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Pretium Replica',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Constants.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Constants.backgroundColor),
        inputDecorationTheme: InputDecorationTheme(
          // Consistent input decoration theme for all TextField
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.backgroundColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          labelStyle: const TextStyle(color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // Consistent button styling
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: const Size(double.infinity, 40),
          ),
        ),
      ),
      initialRoute: "/on_boarding",
      getPages: [
        GetPage(name: '/on_boarding', page: () => OnBoardingScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/forgot_password', page: () => ForgotPasswordScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
