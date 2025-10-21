import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_button.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/price_entity.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/cubit/price_listing_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ListedCoinsWidget extends StatelessWidget {
  const ListedCoinsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      constraints: BoxConstraints(minHeight: 160.h, maxHeight: 380.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgBorder),
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.bgSecondary,
      ),
      child: BlocBuilder<PriceListingCubit, PriceListingState>(
        builder: (context, state) {
          if (state.loadStatus.isLoading) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: AppColors.bgBorder,
                  highlightColor: AppColors.bgSecondary,
                  child: Container(color: AppColors.bgBorder, height: 76.h),
                );
              },
              separatorBuilder: (_, __) => 10.verticalSpace,
              itemCount: 3,
            );
          } else if (state.loadStatus.isSuccess) {
            final coins = state.prices.values.toList();
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final coin = coins[index];
                return coinListTile(coin);
              },
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: AppColors.bgBorder),
              itemCount: coins.length,
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.inter(
                    'Failed to load prices',
                    fontSize: 14.sp,
                    color: AppColors.error,
                  ),
                  20.verticalSpace,
                  AppButton(
                    text: 'Retry',
                    onTap: () {
                      context.read<PriceListingCubit>().subscribe();
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Container coinListTile(PriceEntity coin) {
    return Container(
      height: 76.h,
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(AppSvg.bitcoin, width: 32.r, height: 32.r),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.inter(
                  coin.symbol,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                2.verticalSpace,
                AppText.inter(
                  '\$${coin.price}',
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.inter(
                '\$${coin.price.toStringAsFixed(2)}',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),

              2.verticalSpace,
              AppText.inter('+5.32%', fontSize: 12.sp, color: AppColors.error),
            ],
          ),
        ],
      ),
    );
  }
}
