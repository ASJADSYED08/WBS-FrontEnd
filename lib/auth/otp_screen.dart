import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:ned_project/auth/create_profile.dart';
import 'package:ned_project/export_alll.dart';
import 'package:ned_project/services.dart';
export 'package:circular_countdown_timer/circular_countdown_timer.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  final CountDownController _controller = CountDownController();

  bool complete = false;
  final int _duration = 10;
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
        bottomNavigationBar: complete
            ? Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t receive OTP?',
                      style: TextStyle(
                        color: Color(0xff5A6C7D),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          apiServices().ResendOtpUser(context, {}).then(
                            (res_data) async {
                              if (mounted) {
                                setState(() {
                                  _controller.start();
                                  complete = false;
                                });
                              }
                            },
                          );
                        });
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Color(0xff0078D4),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                0.12.sh.verticalSpace,
                Text(
                  "Verify OTP",
                  style: TextStyle(fontSize: 46.sp, fontWeight: FontWeight.w600, color: Color(0xff1E3A5F)),
                ),
                SizedBox(height: 12.h),
                Text(
                  "We've sent a verification code to your email",
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: Color(0xff5A6C7D)),
                ),
                50.h.verticalSpace,
                Center(
                  child: OTPTextField(
                    controller: otpController,
                    length: 4,
                    width: Get.width,
                    fieldWidth: 75.w,
                    style: TextStyle(
                      color: Color(0xff1E3A5F),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                    textFieldAlignment: MainAxisAlignment.center,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 16.r,
                    spaceBetween: 16.w,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.white,
                      borderColor: Color(0xffE8ECF1),
                      focusBorderColor: Color(0xff0078D4),
                      enabledBorderColor: Color(0xffE8ECF1),
                      disabledBorderColor: Color(0xffE8ECF1),
                      errorBorderColor: Colors.red,
                    ),
                    onCompleted: (value) {
                      setState(() {
                        print("Code${value}");
                        var data = {
                          "otpKey": value.toString(),
                        };
                        // apiServices().verifyOtp(context, data);
                        Get.to(() => CreateProfileScreen());
                      });
                    },
                    onChanged: (value) {
                      print("OTP Changed: $value");
                    },
                  ),
                ),
                0.2.sh.verticalSpace,
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff0078D4).withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CircularCountDownTimer(
                      duration: _duration,
                      initialDuration: 0,
                      controller: _controller,
                      width: 0.28.sw,
                      height: 0.2.sh,
                      strokeWidth: 6,
                      ringGradient: null,
                      fillGradient: null,
                      ringColor: Color(0xffE8ECF1),
                      fillColor: Color(0xff0078D4),
                      backgroundColor: Colors.white,
                      backgroundGradient: null,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Color(0xff0078D4),
                        fontWeight: FontWeight.w600,
                      ),
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverse: false,
                      isReverseAnimation: true,
                      isTimerTextShown: true,
                      autoStart: true,
                      onStart: () {
                        debugPrint('Countdown Started');
                      },
                      // This Callback will execute when the Countdown Ends.
                      onComplete: () {
                        // Here, do whatever you want
                        print("object1212");
                        setState(() {
                          complete = true;
                        });
                        // getOtp(context);
                        debugPrint('Countdown Ended');
                      },
                      // This Callback will execute when the Countdown Changes.
                      onChange: (String timeStamp) {
                        // Here, do whatever you want
                        // debugPrint('Countdown Changed $timeStamp');
                      },
                    ),
                  ),
                ),
                0.1.sh.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
