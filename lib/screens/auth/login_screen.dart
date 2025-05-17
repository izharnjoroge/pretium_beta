import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/auth_controller.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/snackbar_messages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController.to;
  bool _obscure = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _authController.setLoading(true);
      // Simulate a login process
      try {
        if (_emailController.text == 'test@example.com' &&
            _passwordController.text == 'password123') {
          await Future.delayed(const Duration(seconds: 2));
          _authController.setLoading(false);
          Get.offNamed('/home');
          SnackBarMessages.snackBars("success", "Logged in successfully!");
        } else {
          await Future.delayed(const Duration(seconds: 1));
          _authController.setLoading(false);
          SnackBarMessages.snackBars(
              "error", "Invalid credentials. Please try again.");
        }
      } catch (e) {
        _authController.setLoading(false);
        SnackBarMessages.snackBars(
            "error", "An error occurred: ${e.toString()}.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          Icons.account_balance_wallet,
                          size: 50,
                          color: Constants.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32.0),
                  CustomTextField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.email_outlined),
                      onPressed: () {},
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!GetUtils.isEmail(value)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    obscureText: _obscure,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.lock_outline),
                      onPressed: () {},
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            activeColor: Constants.backgroundColor,
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black54),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/forgot_password');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Constants.backgroundColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Obx(() {
                    return CustomButton(
                      text: 'Login',
                      onPressed: _login,
                      isLoading: _authController.isLoading.value,
                    );
                  }),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 14.0, color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/signup');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Constants.backgroundColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
