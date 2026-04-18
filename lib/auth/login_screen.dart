import 'package:ned_project/auth/create_profile.dart';
import 'package:ned_project/auth/sign_up_screen.dart';
import 'package:ned_project/controller/login_controller.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/screens/nav_bar_screen.dart';
import 'package:ned_project/widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _LoginController = Get.put(LoginController());

  final TextEditingController passwordController = Get.put(TextEditingController());

  RxString error = ''.obs;

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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(() => SignUpScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Color(0xff5A6C7D)),
                ),
                Text(
                  "Sign Up",
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    0.12.sh.verticalSpace,
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 46.sp, fontWeight: FontWeight.w600, color: Color(0xff1E3A5F)),
                    ),
                    50.h.verticalSpace,
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Color(0xff2C3E50)),
                    ),
                    7.h.verticalSpace,
                    AppTextField(
                      validate: (text) {
                        final emailRegExp = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]{2,}$');

                        if (text == null || text.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!emailRegExp.hasMatch(_LoginController.emailController.text)) {
                          return 'Please enter a valid email address';
                        }
                      },
                      errorMessage: error,
                      controller: _LoginController.emailController,
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
                        size: 20,
                        color: Color(0xff0078D4),
                      ),
                    ),
                    10.h.verticalSpace,
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Color(0xff2C3E50)),
                    ),
                    7.h.verticalSpace,
                    Obx(
                      () => AppTextField(
                        validate: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please fill in the required information';
                          }
                          if (text.length < 8) {
                            return 'Password should be greater than 8 characters';
                          }
                        },
                        hintText: 'Enter your password',
                        hintColor: Color(0xff8A9BAE),
                        errorMessage: error,
                        radius: 14.r,
                        controller: _LoginController.passwordController,
                        border: true,
                        bgcolor: Colors.white,
                        color: Color(0xff2C3E50),
                        borderColor: Color(0xffE8ECF1),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0078D4), width: 2),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        obsecureText: _LoginController.obscurePassword.value,
                        suffixIcon: InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            _LoginController.obscurePassword.value = !_LoginController.obscurePassword.value;
                          },
                          child:
                              Icon(_LoginController.obscurePassword.value ? Icons.lock : Icons.lock_open_rounded, size: 20, color: Color(0xff0078D4)),
                        ),
                      ),
                    ),
                    16.h.verticalSpace,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Get.to(() => const ForgotPasswordScreen());
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0078D4),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    // 0.26.sh.verticalSpace,
                    AppButton(
                        text: "Login",
                        onPressed: () {
                          var data = {
                            "email": _LoginController.emailController.text.trim(),
                            "password": _LoginController.passwordController.text.trim(),
                          };
                          // Get.offAll(() => NavbarScreen());
                          _LoginController.login(context, data);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
