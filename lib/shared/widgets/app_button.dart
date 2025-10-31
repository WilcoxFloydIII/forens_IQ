import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onPressed;
  final double height;
  final bool brandButton;
  final String text;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.height,
    required this.brandButton,
    required this.text,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                color: widget.brandButton
                    ? AppColors.brand
                    : AppColors.brandSecondary,
              ),
              child: Center(
                child: Text(widget.text, style: AppTextStyles.onBrandButton),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
