import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/auth_controller.dart';
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
      title: 'Pretium Clone',
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
      getPages: Constants().screenRoutes,
    );
  }
}
