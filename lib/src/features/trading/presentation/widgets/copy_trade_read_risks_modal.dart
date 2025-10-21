import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';

class CopyTradeReadRisksModal extends StatelessWidget {
  const CopyTradeReadRisksModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Notch at the top
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              color: AppColors.bgBorder,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.foregroundPrimary,
                        size: 24.sp,
                      ),
                    ),
                    20.horizontalSpace,
                  ],
                ),
                AppText.inter(
                  'Risks involved in Copy Trading',
                  fontSize: 20.sp,
                  color: AppColors.foregroundPrimary,
                  fontWeight: FontWeight.w800,
                  textAlign: TextAlign.center,
                ),
                8.verticalSpace,
                AppText.inter(
                  'Please make sure you read the following risks involved in copy trading before making a decision.',
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                ),
                32.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  constraints: BoxConstraints(maxHeight: 512.h),
                  decoration: BoxDecoration(
                    color: AppColors.bgSecondary,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.bgBorder),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      riskInfo(
                        'Market Risks',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                      Divider(color: AppColors.bgBorder, height: 10.h),
                      riskInfo(
                        'Dependency on others',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                      Divider(color: AppColors.bgBorder, height: 10.h),
                      riskInfo(
                        'Mismatched risk profiles',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                      Divider(color: AppColors.bgBorder, height: 10.h),
                      riskInfo(
                        'Control and understanding',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                      Divider(color: AppColors.bgBorder, height: 10.h),
                      riskInfo(
                        'Emotional decision',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                      Divider(color: AppColors.bgBorder, height: 10.h),
                      riskInfo(
                        'Costs involved',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                      Divider(color: AppColors.bgBorder, height: 10.h),
                      riskInfo(
                        'Diversity',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                      Divider(color: AppColors.bgBorder, height: 10.h),
                      riskInfo(
                        'Execution risks',
                        'All investments carry risks, including potential loss of capital.',
                      ),
                    ],
                  ),
                ),

                32.verticalSpace,
                AppButton(
                  text: 'I have read the risks',
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget riskInfo(String title, String description) {
    return ExpandablePanel(
      header: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: AppText.inter(
          title,
          fontSize: 14.sp,
          color: AppColors.foregroundPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      collapsed: SizedBox.shrink(),
      expanded: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: AppText.inter(
          description,
          fontSize: 14.sp,
          color: AppColors.textSecondary,
        ),
      ),
      theme: ExpandableThemeData(
        hasIcon: true,
        iconColor: AppColors.foregroundPrimary,
        iconSize: 20.sp,
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        iconPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}
