import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/extensions/num_extension.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class RiskLevelOptionsWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool selected;
  final VoidCallback? onTap;

  const RiskLevelOptionsWidget({
    super.key,
    required this.title,
    required this.description,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108.h,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedContainer(
                  duration: 300.milliseconds,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: selected
                          ? AppColors.foregroundLink
                          : AppColors.bgBorder,
                      width: 1,
                    ),
                    color: AppColors.bgSecondary,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: AnimatedOpacity(
                  opacity: selected ? 1.0 : 0.0,
                  duration: 300.milliseconds,
                  child: Container(
                    width: 27.w,
                    height: 17.h,
                    decoration: BoxDecoration(
                      color: AppColors.foregroundLink,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                      ),
                    ),
                    child: CustomImage(AppSvg.check),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 12.r,
                right: 12.r,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.encodeSans(
                      title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    AppText.inter(
                      description,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
