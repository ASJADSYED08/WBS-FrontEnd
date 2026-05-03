import 'package:ned_project/auth/global.dart';
import 'package:ned_project/auth/login_screen.dart';
import 'package:ned_project/auth/otp_screen.dart';
import 'package:ned_project/controller/sign_up_controller.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/widgets/app_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupController _SignupController = Get.put(SignupController());
  RxString error = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     // begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //       Color(0xff0AE5C7).withOpacity(0.2),
      //       Color(0xff0E59CD).withOpacity(0.2),
      //     ],
      //   ),
      // ),
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(() => LoginScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Color(0xff5A6C7D)),
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xff0078D4),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff0078D4),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                0.12.sh.verticalSpace,
                Text(
                  "SignUp",
                  style: TextStyle(
                      fontSize: 46.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1E3A5F)),
                ),
                22.h.verticalSpace,
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2C3E50)),
                ),
                7.h.verticalSpace,
                AppTextField(
                  errorMessage: error,
                  controller: _SignupController.firstNameController,
                  onChange: (p0) {},
                  hintText: 'Enter your name',
                  hintColor: Color(0xff8A9BAE),
                  bgcolor: Colors.white,
                  color: Color(0xff2C3E50),
                  borderColor: Color(0xffE8ECF1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Color(0xff0078D4),
                    size: 20,
                  ),
                ),
                10.h.verticalSpace,
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2C3E50)),
                ),
                7.h.verticalSpace,
                AppTextField(
                  errorMessage: error,
                  controller: _SignupController.emailController,
                  onChange: (p0) {},
                  hintText: 'Enter your email',
                  hintColor: Color(0xff8A9BAE),
                  bgcolor: Colors.white,
                  color: Color(0xff2C3E50),
                  borderColor: Color(0xffE8ECF1),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                    color: Color(0xff0078D4),
                    size: 20,
                  ),
                ),
                10.h.verticalSpace,
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2C3E50)),
                ),
                7.h.verticalSpace,
                Obx(
                  () => AppTextField(
                    hintText: 'Enter your password',
                    hintColor: Color(0xff8A9BAE),
                    errorMessage: error,
                    radius: 14.r,
                    controller: _SignupController.passwordController,
                    border: true,
                    bgcolor: Colors.white,
                    color: Color(0xff2C3E50),
                    borderColor: Color(0xffE8ECF1),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff0078D4), width: 2),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    obsecureText: _SignupController.obscurePassword.value,
                    suffixIcon: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        _SignupController.obscurePassword.value =
                            !_SignupController.obscurePassword.value;
                      },
                      child: Icon(
                          _SignupController.obscurePassword.value
                              ? Icons.lock
                              : Icons.lock_open_rounded,
                          size: 20,
                          color: Color(0xff0078D4)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.04,
                ),
                //asjaddddd
                AppButton(
                  text: "Sign Up",
                  onPressed: () {
                    var data = {
                      "name": _SignupController.firstNameController.text.trim(),
                      "email": _SignupController.emailController.text.trim(),
                      "password":
                          _SignupController.passwordController.text.trim(),
                    };
                    user_email = _SignupController.emailController.text
                        .trim()
                        .toString();
                    user_name =
                        _SignupController.firstNameController.text.toString();

                    _SignupController.signUp(context, data);
                    // Get.to(() => OtpScreen());
                  },
                ),
                0.02.sh.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
