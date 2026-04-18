import 'package:ned_project/export_alll.dart';
import 'package:ned_project/services.dart';

class HomeController extends GetxController {
  var nameController = TextEditingController();
  var scopeController = TextEditingController();

  RxString errorMessageName = "".obs;
  RxString errorMessageScope = "".obs;

  validateName() {
    if (nameController.text.trim().isEmpty) {
      errorMessageName.value = "Please Enter Name";
    }
    // else if(passwordController.text.trim().length <8){
    //   errorMessagePassword.value = "Password Should be Minimum 8 Characters";
    // }
    else {
      errorMessageName.value = "";
    }
  }

  validateScope() {
    if (scopeController.text.trim().isEmpty) {
      errorMessageScope.value = "Please Enter scope";
    }
    // else if(passwordController.text.trim().length <8){
    //   errorMessagePassword.value = "Password Should be Minimum 8 Characters";
    // }
    else {
      errorMessageScope.value = "";
    }
  }

  void generateWBS(context, data) {
    validateName();
    validateScope();
    if (errorMessageName.value == "" && errorMessageScope.value == "") {
      apiServices().generateWBS(context, data);
      print(data);
    } else {
      Get.snackbar(
        "Alert!",
        "All Fields Required",
        backgroundColor: Color(0xff0078D4).withOpacity(0.9),
        colorText: Colors.white,
      );
      print("Login validation failed");
    }
  }
}
