import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/widgets/copy_trading_intro_widget.dart';

class CopyTradingIntroScreen extends StatefulWidget {
  const CopyTradingIntroScreen({super.key});

  @override
  State<CopyTradingIntroScreen> createState() => _CopyTradingIntroScreenState();
}

class _CopyTradingIntroScreenState extends State<CopyTradingIntroScreen> {
  late final PageController _pageController;
  final animDuration = const Duration(milliseconds: 1600);
  int _indicatorIndex = -1;
  int _currentPage = 0;
  Timer? _pageChangeTimer;

  @override
  void initState() {
    super.initState();
    int initialPage = 0;
    _pageController = PageController(initialPage: initialPage);
    _pageChangeTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < 1) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: animDuration,
          curve: Curves.easeInOut,
        );
      } else {
        _pageChangeTimer?.cancel();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _indicatorIndex = initialPage;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageChangeTimer?.cancel();
    super.dispose();
  }

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
            context.push(AppRoutes.copyTradingRiskLevel);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            10.verticalSpace,
            Row(
              children: [
                _buildIndicatorBar(0),
                5.horizontalSpace,
                _buildIndicatorBar(1),
              ],
            ),
            10.verticalSpace,
            Expanded(
              child: PageView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _indicatorIndex = index;
                  });
                },
                children: [
                  CopyTradingIntroWidget(
                    title: 'Copy PRO traders',
                    description:
                        'Leverage expert strategies from professional traders to boost your trading results.',
                    image: AppSvg.copyProTraders,
                  ),
                  CopyTradingIntroWidget(
                    title: 'Do less, Win more',
                    description:
                        'Streamline your approach to trading and increase your winning potential effortlessly.',
                    image: AppSvg.doLessWithMore,
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Text(
              'Watch a how to video',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.foregroundLink,
              ),
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorBar(int index) {
    bool isActive = _indicatorIndex >= index;
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: 2,
            alignment: Alignment.centerLeft,
            width: constraints.maxWidth,

            decoration: BoxDecoration(
              color: AppColors.bgBorder,
              borderRadius: BorderRadius.circular(3),
            ),
            child: AnimatedContainer(
              height: 6,
              width: constraints.maxWidth * (isActive ? 1 : 0),
              duration: animDuration,
              decoration: BoxDecoration(
                color: AppColors.foregroundLink,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          );
        },
      ),
    );
  }

  void getStarted() {
    context.push(AppRoutes.copyTradingRiskLevel);
  }
}
