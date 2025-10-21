import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class CopyTradingIntroWidget extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const CopyTradingIntroWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        AppText.inter(
          title,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        5.verticalSpace,
        AppText.inter(
          description,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        Expanded(
          child: Align(child: CustomImage(image, width: 270.w)),
        ),
      ],
    );
  }
}
