import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_dropdown.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/trader_listing_entity.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/dotted_chart_widget.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/glow_line_chart_widget.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/hollow_pie_chart_widget.dart';

class TraderChartTab extends StatelessWidget {
  const TraderChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        roiChartContainer(),
        5.verticalSpace,
        totalPNLContainer(),
        5.verticalSpace,
        assetsAllocationContainer(),
        5.verticalSpace,
        holdingContainer(),
      ],
    );
  }

  Container holdingContainer() {
    return Container(
      height: 308.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgBorder),
        color: AppColors.bgSecondary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Holding period",
                style: GoogleFonts.encodeSans(
                  color: AppColors.textPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              AppDropdown.daily(),
            ],
          ),
          20.verticalSpace,
          Expanded(child: DottedChartWidget()),
        ],
      ),
    );
  }

  Container assetsAllocationContainer() {
    return Container(
      height: 264.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgBorder),
        color: AppColors.bgSecondary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Total PNL",
                style: GoogleFonts.encodeSans(
                  color: AppColors.textPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              AppDropdown.daily(),
            ],
          ),
          20.verticalSpace,
          Expanded(child: HollowPieChartWidget()),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget totalPNLContainer() {
    return Container(
      height: 308.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgBorder),
        color: AppColors.bgSecondary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Total PNL",
                style: GoogleFonts.encodeSans(
                  color: AppColors.textPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Spacer(),
              AppDropdown.daily(),
            ],
          ),
          20.verticalSpace,
          Expanded(child: GlowLineChartWidget()),
        ],
      ),
    );
  }

  Widget roiChartContainer() {
    return Container(
      height: 322.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.bgBorder),
          left: BorderSide(color: AppColors.bgBorder),
          right: BorderSide(color: AppColors.bgBorder),
        ),
        color: AppColors.bgSecondary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "ROI",
                style: GoogleFonts.encodeSans(
                  color: AppColors.textPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Spacer(),
              AppDropdown.daily(),
            ],
          ),
          20.verticalSpace,
          Expanded(child: GlowLineChartWidget()),
        ],
      ),
    );
  }
}
