import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/extensions/num_extension.dart';
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
                          Text(
                            trader.name,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
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
                              Text(
                                trader.followers.toString(),
                                style: TextStyle(
                                  color: AppColors.foregroundLink,
                                  fontSize: 12.sp,
                                ),
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
                          child: Text(
                            'Copy',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
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
                                Text(
                                  'ROI',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  trader.roiString,
                                  style: GoogleFonts.encodeSans(
                                    color: AppColors.textSuccess,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Total PNL: ',
                                        style: TextStyle(
                                          color: AppColors.textSecondary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: trader.totalProfit
                                            .toMoneyFormat(),
                                        style: TextStyle(
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
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '${trader.winRate}%',
                        style: TextStyle(
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
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: trader.totalProfit.toMoneyFormat(),
                        style: TextStyle(
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
