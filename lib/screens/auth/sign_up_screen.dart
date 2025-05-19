import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/auth_controller.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/snackbar_messages.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController.to;
  bool _termsAccepted = false;
  bool _obscure = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signup() async {
    if (_formKey.currentState!.validate() && _termsAccepted) {
      _authController.setLoading(true);

      try {
        if (_emailController.text == 'test@example.com' &&
            _passwordController.text == 'password123') {
          await Future.delayed(const Duration(seconds: 2));
          _authController.setLoading(false);
          Get.offNamed('/pin_creation');
          SnackBarMessages.snackBars("success", "Signed up successfully!");
        } else {
          await Future.delayed(const Duration(seconds: 1));
          _authController.setLoading(false);
          SnackBarMessages.snackBars(
              "error", "Failed to sign up. Please check your information.");
        }
      } catch (e) {
        _authController.setLoading(false);
        SnackBarMessages.snackBars(
            "error", "An error occurred: ${e.toString()}.");
      }
    } else if (!_termsAccepted) {
      SnackBarMessages.snackBars(
          "error", "Please accept the terms and conditions.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Text(
                      'Simplify your crypto payments with us',
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(height: 32.0),
                CustomTextField(
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.person_2_outlined),
                    onPressed: () {},
                  ),
                  controller: _firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.person_2_outlined),
                    onPressed: () {},
                  ),
                  controller: _lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.email_outlined),
                    onPressed: () {},
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.lock_outline),
                    onPressed: () {},
                  ),
                  obscureText: true,
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
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value!;
                        });
                      },
                      activeColor: Constants.backgroundColor,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Accept Terms and Conditions',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Constants.backgroundColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Obx(() {
                  return CustomButton(
                    text: 'Create Account',
                    onPressed: _signup,
                    isLoading: _authController.isLoading.value,
                  );
                }),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 14.0, color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: Text(
                        'Login',
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
    );
  }
}
