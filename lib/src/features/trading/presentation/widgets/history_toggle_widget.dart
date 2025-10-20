import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';

class HistoryToggleWidget extends StatelessWidget {
  final bool showHistory;
  final void Function(bool) onToggle;
  const HistoryToggleWidget({
    super.key,
    required this.showHistory,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 221.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: AppColors.bgTertiary1,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: showHistory
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 110.5.w,
                  height: 32.h,
                  margin: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: AppColors.bgPrimary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onToggle(false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Open Trades',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onToggle(true);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Trade History',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
