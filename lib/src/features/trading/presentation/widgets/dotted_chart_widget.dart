import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';

class DottedChartWidget extends StatelessWidget {
  const DottedChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        borderData: FlBorderData(show: false),
        scatterSpots: [
          ScatterSpot(1, 1),
          ScatterSpot(2, 3),
          ScatterSpot(3, 2),
          ScatterSpot(4, 4),
          ScatterSpot(5, 3.5),
        ],
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 5,
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

              getTitlesWidget: (value, meta) {
                return AppText.inter(
                  '${value.toInt()}K',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                );
              },
            ),
          ),
        ),
        // borderData: FlBorderData(
        //   show: true,
        //   border: Border.all(color: Colors.black12),
        // ),
      ),
    );
  }
}
