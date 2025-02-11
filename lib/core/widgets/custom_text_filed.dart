import 'package:flutter/material.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/core/extentions/extentions.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.height,
    this.width,
    this.keyboardType,
    this.icon,
    this.title,
    this.isVisible,
    this.fillColor,
    this.isVisibleColor,
    this.titleTextStyle,
    this.textFieldStyle,
    this.cursorColor,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.borderRadius,
    this.vertical,
    this.readOnly,
    this.borderColor,
    this.focusedBorderColor, // خاصية جديدة
    this.disabledBorderColor, // خاصية جديدة
    this.textSize, // خاصية جديدة
  });

  final String? hintText;
  final String? label;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final IconData? icon;
  final String? title;
  final bool? isVisible;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? isVisibleColor;
  final Color? cursorColor;
  final TextStyle? titleTextStyle;
  final TextStyle? textFieldStyle;
  final int? minLines;
  final int? maxLines;
  final double? borderRadius;
  final double? vertical;
  final bool? readOnly;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final double? textSize;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;

  void toggleObscureText() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      style: widget.textFieldStyle ??
          context.textTheme.bodySmall
              ?.copyWith(fontSize: widget.textSize ?? 14),
      cursorColor: widget.cursorColor ?? Colors.black,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.isVisible == true ? isObscure : false,
      validator: widget.validator ??
          (value) {
            if (value?.isEmpty ?? true) {
              return "please enter ${widget.label}";
            } else {
              return null;
            }
          },
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.vertical ?? 15,
          horizontal: 20,
        ),
        isDense: true,
        prefixIcon: widget.icon != null
            ? Icon(widget.icon!, color: AppColors.primaryColor)
            : null,
        suffixIcon: widget.isVisible == true
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: widget.isVisibleColor ?? AppColors.primaryColor,
                ),
                onPressed: toggleObscureText,
              )
            : widget.suffixIcon,
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        hintText: widget.hintText ?? 'كلمة المرور',
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.black,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 45),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.disabledBorderColor ??
                AppColors.darkGrey.withOpacity(0.2),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? AppColors.primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 45),
        ),
      ),
    );
  }
}
