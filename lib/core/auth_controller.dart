import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }
}
