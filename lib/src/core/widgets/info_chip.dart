import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';

class InfoChip extends StatelessWidget {
  final String text;
  const InfoChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: AppText.inter(
        text,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        color: AppColors.textSecondary,
      ),
      side: BorderSide.none,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      backgroundColor: AppColors.bgSecondary,
    );
  }
}
