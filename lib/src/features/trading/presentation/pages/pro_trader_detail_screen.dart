import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';
import 'package:roqu_copy_trader/src/core/widgets/info_chip.dart';
import 'package:roqu_copy_trader/src/core/widgets/user_profile_icon.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/all_trades_tab.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/copy_trade_agree_terms_modal.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/copy_trade_read_risks_modal.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/stats_tab.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/trader_chart_tab.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/traders_tab.dart';

class ProTraderDetailScreen extends StatelessWidget {
  const ProTraderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: 'Trading details'),
      bottomNavigationBar: Container(
        height: 108.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        color: AppColors.bgSecondary,
        alignment: Alignment.topCenter,
        child: AppButton(
          text: 'Copy Trade',
          onTap: () {
            copyTrade(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          20.verticalSpace,
          Row(
            children: [
              UserProfileIcon(initial: 'BM', width: 51.w),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.inter(
                    'BTC master',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),

                  4.verticalSpace,
                  Row(
                    children: [
                      CustomImage(
                        AppSvg.people,
                        color: AppColors.foregroundLink,
                        width: 12.r,
                        height: 12.r,
                      ),
                      4.horizontalSpace,
                      AppText.inter(
                        '500 copiers',
                        fontWeight: FontWeight.w500,
                        color: AppColors.foregroundLink,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          10.verticalSpace,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              InfoChip(text: '43 trading days'),
              InfoChip(text: '15% profit-share'),
              InfoChip(text: '56 total orders'),
            ],
          ),
          10.verticalSpace,

          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(16.r),
            //   border: Border.all(color: AppColors.bgBorder),
            //   color: AppColors.bgSecondary,
            // ),
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  Container(
                    height: 85.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.r),
                      ),
                      border: Border.all(color: AppColors.bgBorder),
                      color: AppColors.bgSecondary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        12.verticalSpace,
                        Row(
                          children: [
                            AppText.inter(
                              'Certified PROTrader',
                              fontSize: 14.sp,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                            const Spacer(),
                            CustomImage(AppSvg.verifiedIcon),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            iconInfoWidget(
                              'High win rate',
                              AppSvg.barChart,
                              AppColors.textSuccess,
                            ),
                            8.horizontalSpace,
                            iconInfoWidget(
                              'Great risk control',
                              AppSvg.lineChart,
                              AppColors.textError,
                            ),
                          ],
                        ),

                        12.verticalSpace,
                      ],
                    ),
                  ),
                  5.verticalSpace,
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: AppColors.bgBorder),
                        left: BorderSide(color: AppColors.bgBorder),
                        right: BorderSide(color: AppColors.bgBorder),
                      ),
                      color: AppColors.bgPrimary,
                    ),
                    child: TabBar(
                      // isScrollable: true,
                      tabAlignment: TabAlignment.fill,
                      labelColor: const Color(0xFFE6E1E5),
                      unselectedLabelColor: AppColors.textSecondary,
                      dividerHeight: 0,
                      indicatorColor: AppColors.foregroundLink,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: EdgeInsets.zero,
                      labelStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: [
                        Tab(text: 'Chart'),
                        Tab(text: ' Stats'),
                        Tab(text: 'All Trades'),
                        Tab(text: 'Copiers'),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 300.h,
                      maxHeight: 1.5.sh,
                    ),
                    child: TabBarView(
                      children: [
                        TraderChartTab(),
                        StatsTab(),
                        AllTradesTab(),
                        TradersTab(showBadges: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16.h),
        ],
      ),
    );
  }

  Widget iconInfoWidget(String title, String icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: color.withAlpha((0.08 * 255).toInt()),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImage(icon, width: 16.r, height: 16.r),
          4.horizontalSpace,
          AppText.inter(
            title,
            fontSize: 14.sp,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Future<void> copyTrade(BuildContext context) async {
    // Implement your copy trade logic here
    final result = await showModalBottomSheet<bool?>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CopyTradeAgreeTermsModal(),
    );
    if (result == true) {
      // User agreed to terms
      final readRisks = await showModalBottomSheet<bool?>(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => CopyTradeReadRisksModal(),
      );
      if (readRisks == true) {
        context.push(AppRoutes.enterAmount);
      }
    }
  }
}
