import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxBool isError = false.obs;

  void onRefresh();

  void showLoading() {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';
  }

  void hideLoading() => isLoading.value = false;

  void showError(String message) {
    errorMessage.value = message;
    isError.value = true;
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
