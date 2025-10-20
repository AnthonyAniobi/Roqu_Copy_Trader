import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/enums/risk_level_enum.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/risk_level_options_widget.dart';

class CopyTradingRiskLevelScreen extends StatefulWidget {
  const CopyTradingRiskLevelScreen({super.key});

  @override
  State<CopyTradingRiskLevelScreen> createState() =>
      _CopyTradingRiskLevelScreenState();
}

class _CopyTradingRiskLevelScreenState
    extends State<CopyTradingRiskLevelScreen> {
  RiskLevelEnum riskLevel = RiskLevelEnum.conservative;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: 'Copy Trading'),
      bottomNavigationBar: Container(
        height: 108.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        color: AppColors.bgSecondary,
        alignment: Alignment.topCenter,
        child: AppButton(
          text: 'Proceed',
          onTap: () {
            context.push(AppRoutes.copyTradingDashboard);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            AppText.inter(
              'What risk level are you \ncomfortable exploring?',
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            5.verticalSpace,
            AppText.inter(
              'Choose a level',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            20.verticalSpace,
            RiskLevelOptionsWidget(
              title: 'Conservative profile',
              description:
                  'Conservative profile involves stable returns from proven strategies with minimal volatility.',
              selected: riskLevel == RiskLevelEnum.conservative,
              onTap: () {
                setState(() {
                  riskLevel = RiskLevelEnum.conservative;
                });
              },
            ),
            24.verticalSpace,
            RiskLevelOptionsWidget(
              title: 'Steady growth profile',
              description:
                  'Steady growth involves balanced gains with moderate fluctuations in strategy performance.',
              selected: riskLevel == RiskLevelEnum.steadyGrowth,
              onTap: () {
                setState(() {
                  riskLevel = RiskLevelEnum.steadyGrowth;
                });
              },
            ),
            24.verticalSpace,
            RiskLevelOptionsWidget(
              title: 'Exponential growth profile',
              description:
                  'It has potentials for significant gains or losses due to aggressive trading and market exposure.',
              selected: riskLevel == RiskLevelEnum.exponential,
              onTap: () {
                setState(() {
                  riskLevel = RiskLevelEnum.exponential;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
