import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class CopySuccessScreen extends StatelessWidget {
  const CopySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Spacer(),
              CustomImage(AppSvg.success, width: 102.w, height: 92.h),
              40.verticalSpace,
              AppText.encodeSans(
                'Trade copied successfully',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              4.verticalSpace,
              AppText.inter(
                'You have successfully copied BTC \nMaster\'s trade.',
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                color: AppColors.textSecondary,
              ),
              Spacer(),
              AppButton(
                text: 'Go to Dashboard',
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
