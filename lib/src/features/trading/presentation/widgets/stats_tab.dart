import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_dropdown.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        roiChartContainer(),
        5.verticalSpace,
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
            border: Border.all(color: AppColors.bgBorder),
            color: AppColors.bgSecondary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText.inter(
                "Trading pairs",
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              16.verticalSpace,
              Wrap(
                spacing: 8.w,
                runSpacing: 16.h,
                children:
                    [
                          'BTCUSDT',
                          'ETHUSDT',
                          'XRPUSDT',
                          'LTCUSDT',
                          'ADAUSDT',
                          'DOGEUSDT',
                          'POLUSDT',
                          'SOLUSDT',
                          'DOTUSDT',
                          'MATICUSDT',
                        ]
                        .map(
                          (pair) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.bgTertiary1,
                            ),
                            child: AppText.inter(
                              pair,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget roiChartContainer() {
    return Container(
      height: 404.h,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.bgBorder),
          left: BorderSide(color: AppColors.bgBorder),
          right: BorderSide(color: AppColors.bgBorder),
        ),
        color: AppColors.bgSecondary,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "Trading statistics",
                  style: GoogleFonts.encodeSans(
                    color: AppColors.textPrimary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Spacer(),
                AppDropdown.daily(),
              ],
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 32.r,
                        height: 32.r,
                        child: Stack(
                          children: [
                            Positioned.fill(child: CustomImage(AppSvg.bitcoin)),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 14.r,
                                height: 14.r,
                                decoration: BoxDecoration(
                                  color: AppColors.bgBorder,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: CustomImage(
                                      AppSvg.arrowBack,
                                      width: 7.r,
                                      color: AppColors.error,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.inter(
                              'Average ROI',
                              fontSize: 12.sp,
                              color: AppColors.textSecondary,
                            ),
                            8.verticalSpace,
                          ],
                        ),
                      ),
                      12.horizontalSpace,
                      AppText.inter(
                        '+33.73%',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSuccess,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) =>
                  Divider(color: AppColors.bgBorder, height: 8.h),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
