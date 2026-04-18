import 'package:ned_project/export_alll.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;

  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final bool? shadowoff;
  final bool? border;
  final double? fs;
  final double? radius;
  final EdgeInsets? textPadding;

  AppButton(
      {Key? key,
      this.onPressed,
      this.text,
      this.height,
      this.width,
      this.color,
      this.border = false,
      this.textColor,
      this.iconColor,
      this.fs,
      this.radius,
      this.shadowoff = true,
      this.textPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff0078D4),  // Professional Microsoft blue
              Color(0xff005A9E),  // Deep professional blue
            ],
          ),
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          // border: Border.all(color: AppColors.dimgraycolor),
        ),
        height: height ?? 40.h,
        width: width ?? 168.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.toString(),
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            0.02.sw.horizontalSpace,
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
