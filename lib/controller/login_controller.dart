import 'package:ned_project/export_alll.dart';
import 'package:ned_project/screens/nav_bar_screen.dart';
import 'package:ned_project/services.dart';

class LoginController extends GetxController {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  RxString errorMessagePassword = "".obs;
  RxString errorMessageEmail = "".obs;

  RxBool obscurePassword = true.obs;

  validatePassword() {
    if (passwordController.text.trim().isEmpty) {
      errorMessagePassword.value = "Please Enter Password";
    }
    // else if(passwordController.text.trim().length <8){
    //   errorMessagePassword.value = "Password Should be Minimum 8 Characters";
    // }
    else {
      errorMessagePassword.value = "";
    }
  }

  validateEmail() {
    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text.trim());
    if (emailController.text.trim().isEmpty) {
      errorMessageEmail.value = "Please Enter E-Mail";
    } else if (!emailValid) {
      errorMessageEmail.value = "E-Mail is Invalid";
    } else {
      errorMessageEmail.value = "";
    }
  }

  void login(context, data) {
    validateEmail();
    validatePassword();
    if (errorMessagePassword.value == "" && errorMessageEmail.value == "") {
      print(data);

      apiServices().login(context, data);
    } else {
      Get.snackbar(
        "Alert!",
        "All Fields Required",
      );
      print("Login validation failed");
    }
  }
}
