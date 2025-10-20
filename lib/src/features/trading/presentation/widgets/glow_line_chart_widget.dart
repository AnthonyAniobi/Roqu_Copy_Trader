import 'package:collection/collection.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/trader_listing_entity.dart';

class GlowLineChartWidget extends StatelessWidget {
  const GlowLineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42.h,
              getTitlesWidget: (value, meta) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText.inter(
                      '${(value.toInt() + 1) * 5}d',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ],
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 70.w,
              interval: 25,
              getTitlesWidget: (value, meta) {
                return AppText.inter(
                  '${value.toInt()}%',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                );
              },
            ),
          ),
        ),

        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: TraderListingEntity.mock.portfolioGrowth.mapIndexed((
              index,
              value,
            ) {
              return FlSpot(index.toDouble(), value);
            }).toList(),

            isCurved: true,
            shadow: Shadow(
              color: Color(0xFF58BD7D),
              blurRadius: 0,
              offset: Offset(0, 20),
            ),
            // curveSmoothness: 0.5,
            preventCurveOverShooting: true,
            color: Colors.transparent,
            barWidth: 2,
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
