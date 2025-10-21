import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class CopyTradeAgreeTermsModal extends StatefulWidget {
  const CopyTradeAgreeTermsModal({super.key});

  @override
  State<CopyTradeAgreeTermsModal> createState() =>
      _CopyTradeAgreeTermsModalState();
}

class _CopyTradeAgreeTermsModalState extends State<CopyTradeAgreeTermsModal> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Notch at the top
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              color: AppColors.bgBorder,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: AppColors.foregroundPrimary,
                  size: 24.sp,
                ),
              ),
              20.horizontalSpace,
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CustomImage(
                  AppImages.importantMessage,
                  width: 133.w,
                  height: 96.8.h,
                ),
                16.verticalSpace,
                AppText.inter(
                  'Important message!',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
                16.verticalSpace,
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text:
                        "Don't invest unless you're prepared \nand understand the risks involved in copy trading. \n ",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.textPrimary,
                    ),
                    children: [
                      TextSpan(
                        text: 'Learn more',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.foregroundLink,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = goToPolicy,
                      ),
                      TextSpan(
                        text: 'about the risks.',
                        // style: GoogleFonts.inter(
                        //   fontSize: 12.sp,
                        //   color: AppColors.textPrimary,
                        // ),
                      ),
                    ],
                  ),
                ),
                32.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          side: BorderSide(color: AppColors.bgBorder, width: 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Text.rich(
                          TextSpan(
                            text:
                                'Check this box to agree to Roqu\'s copy trading ',
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.textPrimary,
                            ),
                            children: [
                              TextSpan(
                                text: 'policy',
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  color: AppColors.foregroundLink,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = goToPolicy,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                AppButton(
                  text: 'Proceed to copy trade',
                  onTap: isChecked
                      ? () {
                          Navigator.pop(context, true);
                        }
                      : null,
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goToPolicy() {}
}
