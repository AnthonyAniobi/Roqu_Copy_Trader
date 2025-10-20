import 'package:roqu_copy_trader/src/core/constants/app_assets.dart';

class NavbarItemEntity {
  final String title;
  final String icon;

  NavbarItemEntity({required this.title, required this.icon});

  static NavbarItemEntity home = NavbarItemEntity(
    title: 'Home',
    icon: AppSvg.home,
  );
  static NavbarItemEntity wallet = NavbarItemEntity(
    title: 'Wallet',
    icon: AppSvg.wallet,
  );
  static NavbarItemEntity history = NavbarItemEntity(
    title: 'History',
    icon: AppSvg.transactions,
  );
  static NavbarItemEntity profile = NavbarItemEntity(
    title: 'Profile',
    icon: AppSvg.profile,
  );
}
