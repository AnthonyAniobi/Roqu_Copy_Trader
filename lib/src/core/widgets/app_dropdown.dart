import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';

class AppDropdown {
  static Widget daily({
    String value = "7 days",
    ValueChanged<String?>? onChanged,
    List<String> items = const ["7 days", "14 days", "30 days"],
  }) {
    return Container(
      width: 84.w,
      height: 32.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.bgTertiary1,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.zero,
          isExpanded: true,
          value: value,
          items: items
              .map(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: AppText.inter(
                    value,
                    color: AppColors.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              .toList(),
          onChanged: (String? newValue) {
            // Handle dropdown change
          },
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 16.sp,
            color: AppColors.textPrimary,
          ),
          dropdownColor: AppColors.bgTertiary1,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
