import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class TradersTab extends StatelessWidget {
  final bool showBadges;
  const TradersTab({super.key, required this.showBadges});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 300.h, maxHeight: 1.5.sh),
          color: AppColors.bgSecondary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Traders',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    fillColor: AppColors.bgTertiary1,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),

                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Icon(Icons.search, size: 24.r),
                  ),
                ),
              ),
              16.verticalSpace,
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20.h),
                itemBuilder: (context, _) {
                  return CopierWidget(showBadges: showBadges);
                },
                separatorBuilder: (_, __) =>
                    Divider(color: AppColors.bgPrimary, height: 16.h),
                itemCount: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CopierWidget extends StatelessWidget {
  final bool showBadges;
  const CopierWidget({super.key, required this.showBadges});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.blue, width: 1),
                  color: AppColors.blue.withAlpha((0.14 * 255).toInt()),
                ),
                alignment: Alignment.center,
                child: AppText.inter(
                  'JJ',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.foregroundPrimary,
                ),
              ),
              8.horizontalSpace,
              AppText.inter(
                'John Johnson',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
              Spacer(),
              if (showBadges)
                CustomImage(AppSvg.userBadge, width: 30.w, height: 32.h),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.inter(
                      'Total Copied',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                    AppText.inter(
                      '996.28 USDT',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText.inter(
                      'Trading profit',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                    AppText.inter(
                      '278.81 USDT',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
