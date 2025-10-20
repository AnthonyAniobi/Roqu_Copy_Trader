import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/my_dashboard_header.dart';

class MyDashboardScreen extends StatelessWidget {
  const MyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: 'My Dashboard'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            20.verticalSpace,
            MyDashboardHeader(),
            20.verticalSpace,

            Expanded(
              child: Container(
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
                        indicatorColor: AppColors.foregroundLink,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextStyle(
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
                      SizedBox(
                        height: 400.h,
                        child: TabBarView(
                          children: [
                            Container(), // Chart content
                            Container(), // Current Trades content
                            Container(), // Stats content
                            Container(), // My Trades content
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 16.h),
          ],
        ),
      ),
    );
  }
}
