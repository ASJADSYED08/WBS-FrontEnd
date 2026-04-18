import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/services.dart';

class VideoController extends GetxController {
  var titleController = TextEditingController();
  var addPostImageVideo = ''.obs;
  RxBool isLoading = false.obs;
  RxString errorMessageTitle = "".obs;

  validateTitle() {
    if (titleController.text.trim().isEmpty) {
      errorMessageTitle.value = "Please Enter Title";
    } else {
      errorMessageTitle.value = "";
    }
  }

  Future<void> pickVideoForPost() async {
    final video = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.video,
    );
    if (video != null && video.files.isNotEmpty && video.files.first.path != null) {
      File file = File(video.files.first.path!);
      if (await file.length() > 200 * 1024 * 1024) {
        Get.snackbar("Warning", "File size should not exceed 200 MB.");
        return;
      } else {
        addPostImageVideo.value = file.path;
      }
    } else {
      Get.snackbar("Warning", "No valid files selected. Please select video files.");
    }
  }

  void uploadVideo(context, data, file) {
    validateTitle();

    if (errorMessageTitle.value == "") {
      print(data);

      apiServices().uploadVideo(context, data, file);
    } else {
      Get.snackbar(
        "Alert!",
        "All Fields Required",
      );
      print("Login validation failed");
    }
  }
}
