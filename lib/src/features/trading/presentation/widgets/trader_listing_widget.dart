import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/extensions/num_extension.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';
import 'package:roqu_copy_trader/src/core/widgets/user_profile_icon.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/trader_listing_entity.dart';

class TraderListingWidget extends StatelessWidget {
  final TraderListingEntity trader;
  final VoidCallback? onCopyPressed;

  const TraderListingWidget({
    super.key,
    required this.trader,
    this.onCopyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212.h,
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.bgBorder),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      UserProfileIcon(initial: trader.initials),
                      12.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.inter(
                            trader.name,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimary,
                          ),
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
                                trader.followers.toString(),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.foregroundLink,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        width: 80.w,
                        height: 32.h,
                        child: OutlinedButton(
                          onPressed: onCopyPressed,
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.bgPrimary,
                            side: BorderSide(color: AppColors.bgBorder),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: AppText.inter(
                            'Copy',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Divider(color: AppColors.bgBorder, height: 1),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText.inter(
                                  'ROI',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textSecondary,
                                ),
                                AppText.inter(
                                  trader.roiString,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textSuccess,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Total PNL: ',
                                        style: GoogleFonts.inter(
                                          color: AppColors.textSecondary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: trader.totalProfit
                                            .toMoneyFormat(),
                                        style: GoogleFonts.inter(
                                          color: AppColors.textPrimary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 132.w,
                          height: 60.h,
                          child: lineChart(trader.portfolioGrowth),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            decoration: BoxDecoration(
              color: AppColors.bgPrimary,
              border: Border(top: BorderSide(color: AppColors.bgBorder)),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Win rate: ',
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '${trader.winRate}%',
                        style: GoogleFonts.inter(
                          color: AppColors.textPrimary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'AUM: ',
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: trader.totalProfit.toMoneyFormat(),
                        style: GoogleFonts.inter(
                          color: AppColors.textPrimary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget lineChart(List<double> trades) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),

        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: trades.mapIndexed((index, value) {
              return FlSpot(index.toDouble(), value);
            }).toList(),

            isCurved: true,
            // curveSmoothness: 0.5,
            preventCurveOverShooting: true,
            color: Color(0xFF58BD7D),
            barWidth: 1,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF58BD7D).withAlpha(150),
                  Color(0xFF58BD7D).withAlpha(40),
                  Color(0xFF58BD7D).withAlpha(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
