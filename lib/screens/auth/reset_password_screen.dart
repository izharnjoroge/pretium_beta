import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _resetCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authController = AuthController.to;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _resetCodeController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPasswordSubmit() async {
    if (_formKey.currentState!.validate()) {
      // Simulate password reset success
      await Future.delayed(const Duration(seconds: 1));
      _showPasswordResetSuccessDialog();
    }
  }

  void _showPasswordResetSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Password Reset\nSuccessful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 48.0,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Your password has been reset\nsuccessfully.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Please login with your new\npassword.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF167D7F),
                ),
                onPressed: () {
                  Get.offAllNamed('/login');
                },
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
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
        title: const Text(
          'Reset Password',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Enter the code sent to your email and set\na new password',
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
                const SizedBox(height: 32.0),
                CustomTextField(
                  labelText: 'Reset Code',
                  hintText: 'Enter reset code',
                  controller: _resetCodeController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the reset code';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.history),
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  labelText: 'New Password',
                  hintText: 'Enter new password',
                  controller: _newPasswordController,
                  obscureText: _obscureNewPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureNewPassword = !_obscureNewPassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm new password',
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 32.0),
                Obx(() {
                  return CustomButton(
                    text: 'Reset Password',
                    onPressed: _resetPasswordSubmit,
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
