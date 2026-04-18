import 'dart:io';

import 'package:ned_project/auth/global.dart';
import 'package:ned_project/controller/create_profile_controller.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/screens/nav_bar_screen.dart';
import 'package:ned_project/widgets/app_button.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final CreateProfileController _CreateProfileController = Get.put(CreateProfileController());
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Color(0xffE8ECF1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            20.h.verticalSpace,
            Text(
              'Select Image Source',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1E3A5F),
              ),
            ),
            24.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageSourceOption(
                  icon: Icons.camera_alt_outlined,
                  label: 'Camera',
                  onTap: () {
                    Get.back();
                    _pickImage(ImageSource.camera);
                  },
                ),
                _buildImageSourceOption(
                  icon: Icons.photo_library_outlined,
                  label: 'Gallery',
                  onTap: () {
                    Get.back();
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            20.h.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildImageSourceOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xffF5F7FA),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xffE8ECF1)),
        ),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff0078D4), Color(0xff005A9E)],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            12.h.verticalSpace,
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff1E3A5F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffF5F7FA), // Professional light gray
            Color(0xffE8ECF1), // Subtle blue-gray
            Color(0xffFFFFFF), // Clean white
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffE8ECF1),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xff1E3A5F),
                  size: 15,
                ),
              ),
            ),
          ),
          title: Text(
            'Create Profile',
            style: TextStyle(
              color: Color(0xff1E3A5F),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,

                // Profile Image Section
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _showImageSourceDialog,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _imageFile != null
                                ? Container(
                                    width: 130.w,
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xff0078D4),
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff0078D4).withOpacity(0.2),
                                          blurRadius: 20,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: ClipOval(
                                      child: Image.file(
                                        _imageFile!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 130.w,
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff0078D4),
                                          Color(0xff005A9E),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff0078D4).withOpacity(0.3),
                                          blurRadius: 20,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff0078D4),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.h.verticalSpace,
                      Text(
                        "${user_name}",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1E3A5F),
                        ),
                      ),
                      8.h.verticalSpace,
                      Text(
                        "${user_email}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff5A6C7D),
                        ),
                      ),
                    ],
                  ),
                ),

                40.h.verticalSpace,

                // Business Name Field
                Text(
                  "Business Name",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2C3E50),
                  ),
                ),
                8.h.verticalSpace,
                AppTextField(
                  hintText: 'Enter your business name',
                  hintColor: Color(0xff8A9BAE),
                  errorMessage: _CreateProfileController.errorMessageBusinessName,
                  radius: 14.r,
                  controller: _CreateProfileController.businessNameController,
                  border: true,
                  bgcolor: Colors.white,
                  color: Color(0xff2C3E50),
                  borderColor: Color(0xffE8ECF1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  suffixIcon: Icon(
                    Icons.business_outlined,
                    size: 20,
                    color: Color(0xff0078D4),
                  ),
                ),

                20.h.verticalSpace,

                // Company Size Field
                Text(
                  "Company Size",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2C3E50),
                  ),
                ),
                8.h.verticalSpace,
                AppTextField(
                  hintText: 'e.g., 10-50 employees',
                  hintColor: Color(0xff8A9BAE),
                  errorMessage: _CreateProfileController.errorMessageCompanySize,
                  radius: 14.r,
                  controller: _CreateProfileController.companysizeController,
                  onChange: (p0) {},
                  border: true,
                  bgcolor: Colors.white,
                  color: Color(0xff2C3E50),
                  borderColor: Color(0xffE8ECF1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  suffixIcon: Icon(
                    Icons.people_outline,
                    color: Color(0xff0078D4),
                    size: 20,
                  ),
                ),

                20.h.verticalSpace,

                // Description Field
                Text(
                  "Business Description",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2C3E50),
                  ),
                ),
                8.h.verticalSpace,
                AppTextField(
                  errorMessage: _CreateProfileController.errorMessageDiscription,
                  controller: _CreateProfileController.disccriptionController,
                  hintText: "Describe your business, services, and goals...",
                  hintColor: Color(0xff8A9BAE),
                  maxLines: 5,
                  height: 120,
                  radius: 14.r,
                  border: true,
                  padding: EdgeInsets.all(20),
                  bgcolor: Colors.white,
                  color: Color(0xff2C3E50),
                  borderColor: Color(0xffE8ECF1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),

                40.h.verticalSpace,

                // Proceed Button
                AppButton(
                  text: "Complete Profile",
                  width: double.infinity,
                  onPressed: () {
                    if (_imageFile != null) {
                      var data = {
                        "bussinessName": _CreateProfileController.businessNameController.text.trim(),
                        "companySize": _CreateProfileController.companysizeController.text.trim(),
                        "description": _CreateProfileController.disccriptionController.text.trim(),
                      };
                      // _CreateProfileController.createProfile(context, data, _imageFile);
                      Get.offAll(() => NavbarScreen());
                      print(_imageFile!.path);
                    } else {
                      Get.snackbar(
                        "Alert",
                        "Please upload a profile image",
                        backgroundColor: Color(0xffFFA726).withOpacity(0.9),
                        colorText: Colors.white,
                        snackPosition: SnackPosition.TOP,
                      );
                    }
                  },
                ),

                30.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
