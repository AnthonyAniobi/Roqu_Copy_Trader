import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';

class HollowPieChartWidget extends StatelessWidget {
  const HollowPieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: 2,
            centerSpaceRadius: 90,
            sections: [
              // PieChartSectionData(
              //   value: 40,
              //   color: Colors.blue,
              //   radius: 20,
              //   title: '',
              // ),
              // PieChartSectionData(
              //   value: 30,
              //   color: Colors.red,
              //   radius: 20,
              //   title: '',
              // ),
              PieChartSectionData(
                value: 30,
                color: Color(0xFFfabe76),
                radius: 20,
                title: '',
              ),
            ],
          ),
        ),
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFFF7931A), width: 8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.inter(
                'BTCUSDT',
                fontSize: 12.sp,
                color: AppColors.textPrimary,
              ),
              AppText.inter(
                '100.00%',
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
