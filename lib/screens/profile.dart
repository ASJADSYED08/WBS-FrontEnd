import 'package:ned_project/auth/global.dart';
import 'package:ned_project/auth/login_screen.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/widgets/app_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                      onTap: () {
                        // _anyFile();
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 130.w,
                            height: 130.h,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xff0078D4), Color(0xff005A9E)],
                              ),
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
                            child: profile_picture != ""
                                ? ClipOval(
                                    child: Image.network(
                                      profile_picture,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(Icons.person,
                                    size: 60.r, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    24.h.verticalSpace,
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
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0078D4),
                ),
              ),
              6.h.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Color(0xffE8ECF1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  "${business_name}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2C3E50),
                  ),
                ),
              ),

              20.h.verticalSpace,

              // Company Size Field
              Text(
                "Company Size",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0078D4),
                ),
              ),
              6.h.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Color(0xffE8ECF1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  "${companySize}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2C3E50),
                  ),
                ),
              ),

              20.h.verticalSpace,

              // Description Field
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0078D4),
                ),
              ),
              6.h.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Color(0xffE8ECF1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  "${description}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2C3E50),
                    height: 1.5,
                  ),
                ),
              ),

              40.h.verticalSpace,

              // Logout Button
              AppButton(
                width: double.infinity,
                text: "Log Out",
                onPressed: () {
                  Get.offAll(() => LoginScreen());
                },
              ),

              30.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
