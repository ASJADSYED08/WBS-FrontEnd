import 'package:flutter/services.dart';
import 'package:ned_project/export_alll.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final bool? icon;
  final String? keyValue;
  final String? hintText;
  final double? hintTextSize;
  final String? initialValue;
  final double? inputTextSize;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final bool obsecureText;
  final bool border;
  final bool shadow;
  final bool devider;
  final TextInputType? keyboardType;
  final int maxLines;
  final Color? color;
  final Color? bgcolor;
  final List<TextInputFormatter>? inputFormatters;
  final RxString errorMessage;
  final bool readonly;
  final Function()? ontap;
  final double? radius;
  final OutlineInputBorder? focusedErrorBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  // final OutlineInputBorder focusedErrorBorder;
  final TextInputType? fieldInputType;
  final Color? iconColor;
  final Color? hintColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;

  const AppTextField(
      {Key? key,
      this.controller,
      this.prefixIcon,
      this.icon = true,
      this.width,
      this.height,
      this.keyValue = "1",
      this.hintText,
      this.hintTextSize,
      this.initialValue,
      this.inputTextSize,
      this.suffixIcon,
      this.focusedBorder,
      this.focusedErrorBorder,
      this.enabledBorder,
      this.validate,
      this.onChange,
      this.onFieldSubmitted,
      this.obsecureText = false,
      this.border = true,
      this.shadow = false,
      this.devider = true,
      this.keyboardType,
      this.maxLines = 1,
      this.color,
      this.inputFormatters,
      required this.errorMessage,
      this.readonly = false,
      this.ontap,
      this.radius,
      this.fieldInputType,
      this.iconColor,
      this.bgcolor,
      this.hintColor,
      this.padding,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width ?? Get.width,
          // height: height ?? 56.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgcolor ?? Color(0xff181818),
            borderRadius: BorderRadius.circular(radius ?? 14.r),
          ),
          child: TextFormField(
            validator: validate,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            initialValue: initialValue,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: inputTextSize ?? 14.0,
            ),
            onTap: ontap,
            readOnly: readonly,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            onChanged: onChange,
            inputFormatters: inputFormatters,
            obscureText: obsecureText,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              isCollapsed: true,
              contentPadding: padding ?? const EdgeInsets.only(left: 24),
              fillColor: bgcolor ?? Color(0xff181818),
              filled: true,
              // prefix: prefixIcon != null ? null : wSizedBox20,
              prefixIcon: prefixIcon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: prefixIcon),
                      ],
                    )
                  : null,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                fontSize: hintTextSize ?? 14.0,
                color: hintColor ?? Colors.white,
                fontWeight: FontWeight.w400,
              ),

              focusedErrorBorder: border == true
                  ? focusedBorder ??
                      OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.w),
                        borderRadius: BorderRadius.circular(radius ?? 40.r),
                      )
                  : InputBorder.none,
              focusedBorder: border == true
                  ? focusedBorder ??
                      OutlineInputBorder(
                        borderSide:
                            BorderSide(color: borderColor ?? Color(0xff0078D4), width: 2.w),
                        borderRadius: BorderRadius.circular(radius ?? 40.r),
                      )
                  : InputBorder.none,
              enabledBorder: border == true
                  ? enabledBorder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: shadow
                              ? Colors.transparent
                              : borderColor ?? Color(0xffE8ECF1),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(radius ?? 40.r),
                      )
                  : InputBorder.none,

              errorBorder: border == true
                  ? enabledBorder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: shadow
                              ? Colors.transparent
                              : borderColor ?? Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(radius ?? 40.r),
                      )
                  : InputBorder.none,

              disabledBorder: border == true
                  ? enabledBorder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                          color: shadow
                              ? Colors.transparent
                              : borderColor ?? Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(radius ?? 40.r),
                      )
                  : InputBorder.none,
              isDense: false,
            ),
          ),
        ),
      ],
    );
  }
}
