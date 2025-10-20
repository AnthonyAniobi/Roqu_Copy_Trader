import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_dropdown.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/history_toggle_widget.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/trade_history_widget.dart';

class AllTradesTab extends StatefulWidget {
  const AllTradesTab({super.key});

  @override
  State<AllTradesTab> createState() => _AllTradesTabState();
}

class _AllTradesTabState extends State<AllTradesTab> {
  bool showHistory = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 300.h, maxHeight: 1.2.sh),
          color: AppColors.bgSecondary,
          child: Column(
            children: [
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HistoryToggleWidget(
                      showHistory: showHistory,
                      onToggle: (v) {
                        setState(() {
                          showHistory = v;
                        });
                      },
                    ),
                    AppDropdown.daily(),
                  ],
                ),
              ),
              16.verticalSpace,
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: showHistory ? historyTradesList() : openTradesList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget openTradesList() {
    return ListView.separated(
      // physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.h),
      itemBuilder: (context, index) {
        return TradeHistoryWidget();
      },
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemCount: 8,
    );
  }

  Widget historyTradesList() {
    return ListView.separated(
      // physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.h),
      itemBuilder: (context, index) {
        return TradeHistoryWidget(completed: true);
      },
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemCount: 5,
    );
  }
}
