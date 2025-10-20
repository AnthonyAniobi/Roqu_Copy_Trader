import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/trader_listing_entity.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/trader_listing_widget.dart';

class CopyTradingDashboard extends StatelessWidget {
  const CopyTradingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: 'Copy Trading'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Row(
              children: [
                HomeHeaderButton(myDashboard: true),
                16.horizontalSpace,
                HomeHeaderButton(myDashboard: false),
              ],
            ),
            20.verticalSpace,
            Text(
              'PRO Traders',
              style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
            ),
            8.verticalSpace,
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemBuilder: (context, index) {
                  return TraderListingWidget(trader: TraderListingEntity.mock);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeHeaderButton extends StatelessWidget {
  final bool myDashboard;

  const HomeHeaderButton({super.key, required this.myDashboard});

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = myDashboard
        ? [
            const Color(0xFFABE2F3),
            const Color(0xFFBDE4E5),
            const Color(0xFFEBE9D0),
          ]
        : [
            const Color(0xFFC0CFFE),
            const Color(0xFFF3DFF4),
            const Color(0xFFF9D8E5),
          ];
    List<double> stops = myDashboard ? [0.0, 0.39, 1.0] : [0.0, 0.56, 0.96];
    return Expanded(
      child: SizedBox(
        height: 118.h,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                      stops: stops,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    // borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.all(12.r),
                ),
              ),
              Positioned(
                top: 40.h,
                child: Transform.rotate(
                  angle: -0.8378, // -48 degrees in radians
                  child: Container(
                    width: 250.w,
                    height: 114.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        stops: stops,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      // borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12.h,
                left: 12.w,
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: AppColors.bgTertiary1,
                  child: CustomImage(AppSvg.userTick),
                ),
              ),
              Positioned(
                left: 12.w,
                right: 12.w,
                bottom: 12.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      myDashboard ? 'My dashboard' : 'Become a PRO trader',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.bgPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            myDashboard ? 'View trades' : 'Apply Now',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.bgSecondary,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12.r,
                          color: AppColors.bgPrimary,
                        ),
                      ],
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
