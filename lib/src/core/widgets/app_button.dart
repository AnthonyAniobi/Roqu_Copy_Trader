import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Opacity(
        opacity: enabled ? 1.0 : 0.24,
        child: Container(
          constraints: BoxConstraints(maxHeight: 48.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF483BEB), Color(0xFF7847E1), Color(0xFFDD568D)],
              stops: [0.0, 0.48, 0.96],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.foregroundPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
