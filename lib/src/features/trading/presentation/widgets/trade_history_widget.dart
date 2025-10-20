import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class TradeHistoryWidget extends StatelessWidget {
  final bool completed;
  const TradeHistoryWidget({super.key, this.completed = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 36.h,
          width: double.maxFinite,
          color: AppColors.bgTertiary1,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              CustomImage(AppSvg.bitcoin, width: 20.r, height: 20.r),
              8.horizontalSpace,
              AppText.inter(
                'BTCUSD - ',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              AppText.inter(
                '10X',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.foregroundLink,
              ),
              Spacer(),
              AppText.inter(
                '+3.28% ROI',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSuccess,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!completed)
                Row(
                  children: [
                    AppText.inter(
                      'PRO trader',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 18.r,
                      height: 18.r,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.foregroundPrimary,
                                  width: 1.4,
                                ),
                              ),
                              child: CustomImage(
                                AppImages.sampleImg,
                                borderRadius: BorderRadiusGeometry.circular(
                                  10.r,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CustomImage(
                              AppSvg.verifiedTick,
                              width: 6.7.r,
                              height: 6.7.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                    5.horizontalSpace,
                    AppText.inter(
                      'BTC master',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foregroundLink,
                    ),
                  ],
                ),
              8.verticalSpace,
              infoRow('Entry price', '1.9661 USDT'),
              16.verticalSpace,
              infoRow('Exit price', '1.9725 USDT'),
              16.verticalSpace,
              if (completed) ...[
                infoRow('Copiers', '20'),
                16.verticalSpace,
                infoRow('Copiers amount', '1009.772 USDT'),
                16.verticalSpace,
              ] else ...[
                infoRow('Market price', '1.9725 USDT'),
                16.verticalSpace,
              ],
              infoRow('Entry time', '01:22 PM'),
            ],
          ),
        ),
      ],
    );
  }

  Widget infoRow(String title, String value) {
    return Row(
      children: [
        AppText.inter(
          title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        const Spacer(),
        AppText.inter(
          value,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ],
    );
  }
}
