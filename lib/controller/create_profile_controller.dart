import 'package:ned_project/export_alll.dart';
import 'package:ned_project/services.dart';

class CreateProfileController extends GetxController {
  var businessNameController = TextEditingController();
  var companysizeController = TextEditingController();
  var disccriptionController = TextEditingController();

  RxString errorMessageBusinessName = "".obs;
  RxString errorMessageCompanySize = "".obs;
  RxString errorMessageDiscription = "".obs;
  RxBool obscurePassword = true.obs;

  validateBusinessName() {
    if (businessNameController.text.trim().isEmpty) {
      errorMessageBusinessName.value = "Please Enter BusinessName";
    } else {
      errorMessageBusinessName.value = "";
    }
  }

  validateSize() {
    if (companysizeController.text.trim().isEmpty) {
      errorMessageCompanySize.value = "Please Enter Company Size";
    } else {
      errorMessageCompanySize.value = "";
    }
  }

  ValidateDescription() {
    if (disccriptionController.text.trim().isEmpty) {
      errorMessageDiscription.value = "Please Enter Discription";
    } else {
      errorMessageDiscription.value = "";
    }
  }

  void createProfile(context, data, _imageFile) {
    validateBusinessName();
    validateSize();
    ValidateDescription();
    if (errorMessageBusinessName.value == "" && errorMessageCompanySize.value == "" && errorMessageDiscription.value == "") {
      print(data);

      apiServices().createProfile(context, data, _imageFile);
    } else {
      Get.snackbar(
        "Alert!",
        "All Fields Required",
      );
    }
  }
}
  // Get.to(() => NavbarScreen());