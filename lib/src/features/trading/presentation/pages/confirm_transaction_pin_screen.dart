import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/services/app_routes.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_appbar.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';
import 'package:roqu_copy_trader/src/core/widgets/keypad_widget.dart';

class ConfirmTransactionPinScreen extends StatefulWidget {
  const ConfirmTransactionPinScreen({super.key});

  @override
  State<ConfirmTransactionPinScreen> createState() =>
      _ConfirmTransactionPinScreenState();
}

class _ConfirmTransactionPinScreenState
    extends State<ConfirmTransactionPinScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      if (controller.text.length == 6) {
        confirmTransaction();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          CustomImage(AppImages.unlock, height: 32, width: 32),
          10.verticalSpace,
          AppText.inter(
            'Confirm Transaction',
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
          SizedBox(
            child: AppText.inter(
              'Input your 6 digit transaction PIN to confirm \nyour transaction and authenticate your request',
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgSecondary,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.bgBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(6, (index) {
                        bool isFilled = index < controller.text.length;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          width: 14.w,
                          height: 14.w,
                          decoration: BoxDecoration(
                            color: isFilled
                                ? AppColors.foregroundPrimary
                                : AppColors.bgPrimary,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
              16.horizontalSpace,
              Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.bgSecondary,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.bgBorder),
                ),
                child: CustomImage(AppSvg.biometrics),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: KeypadWidget(controller: controller),
          ),
          40.verticalSpace,
          TextButton(
            onPressed: forgotPin,
            child: AppText.inter(
              'Forgot PIN?',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.foregroundLink,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void forgotPin() {}

  void confirmTransaction() {
    context.push(AppRoutes.copySuccess);
  }
}
