import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/extensions/context_extension.dart';
import 'package:roqu_copy_trader/src/core/extensions/num_extension.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/domain/entities/navbar_item.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback onCenterTap;
  final ValueChanged<int> onItemSelected;

  const CustomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onCenterTap,
  });

  Widget _buildItem(BuildContext context, NavbarItemEntity data, int index) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          onItemSelected(index);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20.r),
          height: 48.r,
          width: 73.r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 28.r,
                width: 28.r,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        data.icon,
                        height: 24.r,
                        width: 24.r,
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? AppColors.foregroundPrimary
                              : AppColors.textSecondary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    // if (isSelected)
                    Align(
                      alignment: Alignment.topRight,
                      child: AnimatedContainer(
                        duration: 200.milliseconds,
                        width: isSelected ? 10.r : 0,
                        height: isSelected ? 10.r : 0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.textError
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedDefaultTextStyle(
                child: Text(data.title),
                style: GoogleFonts.inter(
                  color: isSelected
                      ? AppColors.foregroundPrimary
                      : AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
                duration: 200.milliseconds,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 10.h,
        // top: 6.r,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.color.onSurface.withAlpha(30),
            blurRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
        color: Color(0xFF20252B),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 68.h,
        child: Row(
          children: [
            _buildItem(context, NavbarItemEntity.home, 0),
            _buildItem(context, NavbarItemEntity.wallet, 1),
            Expanded(
              child: InkWell(
                onTap: onCenterTap,
                borderRadius: BorderRadius.circular(24.r),
                child: Container(
                  width: 48.r,
                  height: 48.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF2764FF), Color(0xFF1D3573)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CustomImage(
                    AppSvg.close,
                    width: 20.r,
                    height: 20.r,
                    color: AppColors.foregroundPrimary,
                  ),
                ),
              ),
            ),
            _buildItem(context, NavbarItemEntity.history, 2),
            _buildItem(context, NavbarItemEntity.profile, 3),
          ],
        ),
      ),
    );
  }
}
