import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/widgets/home_copy_trading_banner.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/widgets/home_update_cards.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/widgets/listed_coins_widget.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/widgets/quick_actions_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.84, initialPage: 1);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 166.h,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFC0CFFE),
                    Color(0xFFF3DFF4),
                    Color(0xFFF9D8E5),
                  ],
                  stops: [0.0, 0.56, 0.96],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + 8.h),
                  20.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 104.r,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.foregroundPrimary,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText.inter(
                              'Crypto',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.bgPrimary,
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 18.sp,
                              color: AppColors.bgPrimary,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      CustomImage(AppSvg.search, width: 20.r, height: 20.r),
                      10.horizontalSpace,
                      CustomImage(AppSvg.headphones, width: 20.r, height: 20.r),
                      10.horizontalSpace,
                      SizedBox(
                        width: 20.r,
                        height: 20.r,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CustomImage(
                                AppSvg.notificationIcon,
                                width: 20.r,
                                height: 20.r,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 8.r,
                                height: 8.r,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF3B30),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFFF9D8E5),
                                    width: 1.5.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.horizontalSpace,
                      Container(
                        width: 52.w,
                        height: 28.r,
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Color(
                            0xFF767680,
                          ).withAlpha((0.12 * 255).toInt()),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImage(
                              AppSvg.usFlag,
                              width: 20.r,
                              height: 20.r,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20.sp,
                              color: AppColors.bgPrimary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 108.h),
                decoration: BoxDecoration(
                  color: AppColors.bgPrimary,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.inter(
                          'Your GBP Balance',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                        4.horizontalSpace,
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: '£0',
                        children: [
                          TextSpan(
                            text: '.00',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                        style: GoogleFonts.inter(
                          fontSize: 32.sp,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    QuickActionsWidget(),
                    32.verticalSpace,
                    HomeCopyTradingBannerWidget(),
                    32.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: AppText.inter(
                        'Stay Updated',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 74.h,
                      child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {},
                        itemBuilder: (context, index) {
                          return HomeUpdateCards();
                        },
                        itemCount: 5,
                      ),
                    ),
                    8.verticalSpace,
                    Align(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 5,
                        effect: JumpingDotEffect(
                          dotHeight: 5.h,
                          dotWidth: 5.h,
                          activeDotColor: AppColors.foregroundPrimary,
                          dotColor: AppColors.bgBorder,
                          spacing: 8.w,
                        ),
                      ),
                    ),
                    19.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.inter(
                            'Listed Coins',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                          AppText.inter(
                            'See all',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.foregroundLink,
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    ListedCoinsWidget(),
                    32.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
