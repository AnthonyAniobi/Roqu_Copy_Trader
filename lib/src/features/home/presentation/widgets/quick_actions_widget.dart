import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.bgSecondary,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                actionButton(AppSvg.deposit, 'Deposit'),
                actionButton(AppSvg.buy, 'Buy'),
                actionButton(AppSvg.withdraw, 'Withdraw'),
                actionButton(AppSvg.send, 'Sell'),
              ],
            ),
          ),
          Container(
            width: 77.w,
            height: 28.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.bgSecondary,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(14.r),
              ),
            ),
            child: Text(
              'See more',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.foregroundLink,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget actionButton(String icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: AppColors.bgPrimary,
          child: CustomImage(icon, width: 24.w, height: 24.h),
        ),
        5.verticalSpace,
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
