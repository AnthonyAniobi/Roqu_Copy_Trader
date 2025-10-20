import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';

class UserProfileIcon extends StatelessWidget {
  final String initial;
  final Color color;
  final double? width;

  const UserProfileIcon({
    super.key,
    required this.initial,
    this.color = const Color(0xFF5C8AFF),
    this.width,
  }) : assert(
         initial.length <= 2,
         'Initials should be at most 2 characters long',
       );

  @override
  Widget build(BuildContext context) {
    final width = this.width ?? 38.r;
    final height = width * 1.24;
    final badgeHeight = width / 2;
    final badgeWidth = badgeHeight * 0.34;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 1),
                color: color.withAlpha((0.14 * 255).toInt()),
              ),
              alignment: Alignment.center,
              child: AppText.inter(
                initial,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.foregroundPrimary,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              AppSvg.userBadge,
              width: badgeWidth,
              height: badgeHeight,
            ),
          ),
        ],
      ),
    );
  }
}
