import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({super.key});

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  late final FocusNode focusNode;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController(text: '100');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titleText: 'Enter Amount',
        actions: [currencyDropdown()],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.w, maxWidth: 200.w),
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.foregroundPrimary,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  suffix: AppText.inter(
                    'USD',
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.foregroundPrimary,
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.bgSecondary,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.bgBorder),
              ),
              child: AppText.inter(
                'Transaction fee (1%) - 1.00USD',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.bgSecondary,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.bgBorder),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.inter(
                          'USD Balance',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                        AppText.inter(
                          '\$240.73',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.r,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgTertiary1,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: AppText.inter(
                      'Use Max',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            50.verticalSpace,
            AppButton(text: 'Continue', onTap: confirmAmount),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget currencyDropdown() {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Container(
        height: 28.r,
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: Color(0xFF767680).withAlpha((0.12 * 255).toInt()),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            CustomImage(AppSvg.usFlag, width: 20.r, height: 20.r),
            5.horizontalSpace,
            AppText.inter(
              'USD',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.foregroundPrimary,
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20.sp,
              color: AppColors.foregroundPrimary,
            ),
          ],
        ),
      ),
    );
  }

  void confirmAmount() {
    context.push(AppRoutes.confirmTransaction);
  }
}
