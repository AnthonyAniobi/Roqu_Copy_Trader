import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class ListedCoinsWidget extends StatelessWidget {
  const ListedCoinsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgBorder),
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.bgSecondary,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height: 76.h,
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(AppSvg.bitcoin, width: 32.r, height: 32.r),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.inter(
                        'Bitcoin',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                      2.verticalSpace,
                      AppText.inter(
                        '\$${index * 1000}',
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
                16.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.inter(
                      '\$22,840',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),

                    2.verticalSpace,
                    AppText.inter(
                      '+5.32%',
                      fontSize: 12.sp,
                      color: AppColors.error,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) =>
            Divider(height: 1, color: AppColors.bgBorder),
        itemCount: 5,
      ),
    );
  }
}
