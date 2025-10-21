import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class KeypadWidget extends StatelessWidget {
  final TextEditingController controller;
  const KeypadWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 52.r,
        crossAxisSpacing: 52.r,
        childAspectRatio: 2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) {
          return GestureDetector(
            child: Center(
              child: AppText.inter(
                '.',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.foregroundPrimary,
              ),
            ),
          );
        } else if (index == 10) {
          return GestureDetector(
            onTap: () {
              appendNumber('0');
            },
            child: Center(
              child: AppText.inter(
                '0',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.foregroundPrimary,
              ),
            ),
          );
        } else if (index == 11) {
          return GestureDetector(
            onTap: () {
              backspace();
            },
            child: Center(
              child: CustomImage(AppSvg.arrowBack, width: 12.w, height: 12.h),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              appendNumber('${index + 1}');
            },
            child: Center(
              child: AppText.inter(
                '${index + 1}',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.foregroundPrimary,
              ),
            ),
          );
        }
      },
    );
  }

  void backspace() {
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(
        0,
        controller.text.length - 1,
      );
    }
  }

  void appendNumber(String number) {
    controller.text += number;
  }
}
