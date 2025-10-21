import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  const ConfirmTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: 'Confirm Transaction'),
      bottomNavigationBar: Container(
        height: 108.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        color: AppColors.bgSecondary,
        alignment: Alignment.topCenter,
        child: AppButton(
          text: 'Confirm transaction',
          onTap: () {
            context.push(AppRoutes.enterTransactionPin);
          },
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              32.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.bgSecondary,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.bgBorder),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    16.verticalSpace,
                    CustomImage(AppSvg.usFlag, width: 56.r, height: 56.r),
                    16.verticalSpace,
                    Text(
                      'Copy trading amount',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    1.verticalSpace,
                    AppText.inter(
                      '100 USD',

                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.foregroundPrimary,
                    ),
                    16.verticalSpace,
                    infoRow('Pro Trader', 'BTC Master'),
                    8.verticalSpace,
                    infoRow('What you get', '99 USD'),
                    8.verticalSpace,
                    infoRow('Transaction Fee', '1.00 USD'),
                    10.verticalSpace,
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.inter(
            title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
          AppText.inter(
            value,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }
}
