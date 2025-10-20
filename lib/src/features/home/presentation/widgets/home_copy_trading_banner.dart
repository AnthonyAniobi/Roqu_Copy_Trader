import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class HomeCopyTradingBannerWidget extends StatelessWidget {
  const HomeCopyTradingBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          context.push(AppRoutes.copyTradingIntro);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: SizedBox(
            height: 112.h,
            width: double.maxFinite,
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFABE2F3),
                          Color(0xFFBDE4E5),
                          Color(0xFFEBE9D0),
                        ],
                        stops: [0.0, 0.39, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 26.h,
                  bottom: 0,
                  right: -30.w,
                  child: CustomImage(
                    AppImages.goldCrown,
                    width: 107.w,
                    height: 85.h,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 12.r,
                  bottom: 0,
                  right: 80.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Copy Trading',
                        style: GoogleFonts.encodeSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      AppText.inter(
                        'Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bgPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
