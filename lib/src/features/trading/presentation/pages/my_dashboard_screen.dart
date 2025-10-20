import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/my_dashboard_header.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/stats_tab.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/trade_history_widget.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/trader_chart_tab.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/traders_tab.dart';

class MyDashboardScreen extends StatelessWidget {
  const MyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: 'My Dashboard'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          20.verticalSpace,
          MyDashboardHeader(),
          20.verticalSpace,

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.bgBorder),
              color: AppColors.bgSecondary,
            ),
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: const Color(0xFFE6E1E5),
                    unselectedLabelColor: AppColors.textSecondary,
                    dividerHeight: 0,
                    // labelPadding: EdgeInsets.zero,
                    indicatorColor: AppColors.foregroundLink,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: [
                      Tab(text: 'Chart'),
                      Tab(text: 'Current Trades'),
                      Tab(text: 'Stats'),
                      Tab(text: 'My Traders'),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 300.h,
                      maxHeight: 1.5.sh,
                    ),
                    child: TabBarView(
                      children: [
                        TraderChartTab(),
                        Column(
                          children: [
                            16.verticalSpace,
                            TradeHistoryWidget(),
                            TradeHistoryWidget(),
                          ],
                        ),
                        StatsTab(),
                        TradersTab(showBadges: true),
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
}
