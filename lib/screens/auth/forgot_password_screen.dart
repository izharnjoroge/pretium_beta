import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_beta/widgets/snackbar_messages.dart';

import '../../core/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _authController = AuthController.to;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      _authController.setLoading(true);
      // Simulate reset process

      await Future.delayed(const Duration(seconds: 2));
      _authController.setLoading(false);
      SnackBarMessages.snackBars(
          "success", "Password reset code sent to your email!");
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Text(
                      'Enter your email to receive a password reset code',
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 32.0),
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
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
                const SizedBox(height: 24.0),
                Obx(() {
                  return CustomButton(
                    text: 'Send Reset Code',
                    onPressed: _resetPassword,
                    isLoading: _authController.isLoading.value,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
