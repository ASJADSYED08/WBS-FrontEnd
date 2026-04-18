import 'package:ned_project/auth/otp_screen.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/services.dart';

class SignupController extends GetxController {
  var firstNameController = TextEditingController();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  RxString errorMessageFirstName = "".obs;

  RxString errorMessageEmail = "".obs;
  RxString errorMessagePassword = "".obs;
  RxBool obscurePassword = true.obs;

  validateFirstName() {
    if (firstNameController.text.trim().isEmpty) {
      errorMessageFirstName.value = "Please Enter FirstName";
    } else {
      errorMessageFirstName.value = "";
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

  validatePassword() {
    if (passwordController.text.trim().isEmpty) {
      errorMessagePassword.value = "Please Enter Password";
    } else if (passwordController.text.trim().length < 8) {
      errorMessagePassword.value = "Password should be Minimum 8 Characters";
    } else {
      errorMessagePassword.value = "";
    }
  }

  void signUp(context, data) {
    validateEmail();
    validatePassword();
    validateFirstName();
    if (errorMessagePassword.value == "" && errorMessageEmail.value == "" && errorMessageFirstName.value == "") {
      print(data);

      apiServices().RegisterUser(context, data);
    } else {
      Get.snackbar(
        "Alert!",
        "All Fields Required",
      );
      print("Login validation failed");
    }
  }
}
