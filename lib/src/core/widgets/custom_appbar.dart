import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';
import 'package:roqu_copy_trader/src/core/constants/app_colors.dart';
import 'package:roqu_copy_trader/src/core/services/navigation_backstack_notifier.dart';
import 'package:roqu_copy_trader/src/core/widgets/app_text.dart';
import 'package:roqu_copy_trader/src/core/widgets/custom_image.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final bool centerTitle;
  final List<Widget>? actions;

  const CustomAppbar({
    super.key,
    this.leading,
    this.title,
    this.titleText,
    this.centerTitle = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    Widget? titleWidget;

    if (titleText != null) {
      titleWidget = AppText.inter(
        titleText!,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      );
    } else if (title != null) {
      titleWidget = title!;
    }
    return AppBar(
      forceMaterialTransparency: true,
      leading: ValueListenableBuilder(
        valueListenable: GetIt.I
            .get<NavigationBackstackNotifier>()
            .canPopNotifier,
        builder: (context, canPop, child) {
          if (leading != null) {
            return leading!;
          } else if (canPop) {
            return Center(
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: CustomImage(
                  AppSvg.arrowBackIos,
                  width: 12.r,
                  height: 20.r,
                  color: AppColors.foregroundPrimary,
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      leadingWidth: 65.w,
      automaticallyImplyLeading: false,
      title: titleWidget,
      centerTitle: centerTitle,
      actions: actions,

      actionsPadding: EdgeInsets.symmetric(horizontal: 20.r),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
