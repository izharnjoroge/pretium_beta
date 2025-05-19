import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../widgets/snackbar_messages.dart';

class PinCreationScreen extends StatefulWidget {
  const PinCreationScreen({super.key});

  @override
  State<PinCreationScreen> createState() => _PinCreationScreenState();
}

class _PinCreationScreenState extends State<PinCreationScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _pin = '';
  final int _pinLength = 4;

  @override
  void initState() {
    super.initState();
    _authenticateWithBiometrics();
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } catch (e) {
      setState(() {
        SnackBarMessages.snackBars(
            "error", "Biometric authentication failed or not available.");
      });

      return;
    }

    if (authenticated) {
      Get.offNamed('/home');
      SnackBarMessages.snackBars("success", "Welcome Back!");
    } else {
      SnackBarMessages.snackBars(
          "error", "Biometric authentication cancelled.");
    }
  }

  void _onNumberTap(String number) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin = _pin + number;
        if (_pin.length == _pinLength) {
          Get.offNamed('/main');
          SnackBarMessages.snackBars("success", "Welcome Back!");
        }
      });
    }
  }

  void _onDeleteTap() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF167D7F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.lock_outline,
              size: 60,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'Create a 4-digit PIN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your PIN will be required to access the app',
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pinLength,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index < _pin.length ? Colors.white : Colors.white30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(30),
                children: <String>[
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '',
                  '0',
                  '<x>',
                ].map((key) {
                  if (key.isEmpty) {
                    return const SizedBox.shrink();
                  } else if (key == '<x>') {
                    return InkWell(
                      onTap: _onDeleteTap,
                      borderRadius: BorderRadius.circular(30),
                      child: const Center(
                        child: Icon(Icons.backspace_outlined,
                            color: Colors.white, size: 30),
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () => _onNumberTap(key),
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Text(
                          key,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                    );
                  }
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
