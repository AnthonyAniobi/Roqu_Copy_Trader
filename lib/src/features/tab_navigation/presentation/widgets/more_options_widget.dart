import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class MoreOptionsWidget extends StatelessWidget {
  const MoreOptionsWidget({super.key});

  static show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withAlpha(100),
      builder: (context) {
        return MoreOptionsWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 358.w, maxHeight: 651.h),
          child: Material(
            color: AppColors.bgPrimary,
            borderRadius: BorderRadius.circular(24.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  AppText.inter(
                    'Trade',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                  ),
                  10.verticalSpace,
                  groupWidget([
                    itemTile(
                      title: 'Buy',
                      icon: AppSvg.coinStack,
                      onTap: () {},
                    ),
                    itemTile(
                      title: 'Sell',
                      icon: AppSvg.coinStack,
                      onTap: () {},
                    ),
                    itemTile(
                      title: 'Swap',
                      icon: AppSvg.coinStack,
                      onTap: () {},
                    ),
                    itemTile(
                      title: 'Send',
                      icon: AppSvg.coinStack,
                      onTap: () {},
                    ),
                    itemTile(
                      title: 'Receive',
                      icon: AppSvg.coinStack,
                      onTap: () {},
                    ),
                    itemTile(
                      title: 'Invest',
                      icon: AppSvg.coinStack,
                      onTap: () {},
                      isNew: true,
                    ),
                  ]),
                  20.verticalSpace,
                  AppText.inter(
                    'Earn',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                  ),
                  10.verticalSpace,
                  groupWidget([
                    itemTile(
                      title: "Roqq'n'roll",
                      icon: AppSvg.coinStack,
                      onTap: () {},
                    ),
                    itemTile(title: "Savings", icon: AppSvg.buy, onTap: () {}),
                    itemTile(
                      title: "Savings",
                      icon: AppSvg.coinStack,
                      onTap: () {},
                    ),
                    itemTile(
                      title: "Missions",
                      icon: AppSvg.coinStack,
                      onTap: () {},
                      isNew: true,
                    ),
                    itemTile(
                      title: "Copy trading",
                      icon: AppSvg.coinStack,
                      onTap: () {},
                      isNew: true,
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemTile({
    required String title,
    required String icon,
    required VoidCallback onTap,
    bool isNew = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.bgTertiary1,
              child: CustomImage(
                icon,
                width: 15.r,
                height: 15.r,
                color: Color(0xFF68CFEE),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: AppText.inter(
                title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            if (isNew) ...[
              12.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 1.r),
                decoration: BoxDecoration(
                  color: Color(0xFFF79009).withAlpha(20),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: AppText.inter(
                  'New',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF79009),
                ),
              ),
            ],
            12.horizontalSpace,
            Icon(
              Icons.arrow_forward_ios,
              size: 8.h,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }

  Container groupWidget(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
