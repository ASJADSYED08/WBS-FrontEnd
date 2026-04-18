import 'package:get/get.dart';
import 'package:ned_project/Model/wbsModel.dart';

class UserController extends GetxController {
  static wbsList user = wbsList();

  editWbs(wbsList data) {
    user = data;
    update();
  }
}
