import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:roqu_copy_trader/src/core/services/navigation_backstack_notifier.dart';
import 'package:roqu_copy_trader/src/core/widgets/page_not_found_screen.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/pages/nav_overlay_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/copy_trading_dashboard.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/copy_trading_intro_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/copy_trading_risk_level_screen.dart';

class AppRoutes {
  static const tabOverlay = '/';
  static const copyTradingIntro = '/copy-trading-intro';
  static const copyTradingRiskLevel = '/copy-trading-risk-level';
  static const copyTradingDashboard = '/copy-trading-dashboard';

  static final GoRouter router = GoRouter(
    observers: [GetIt.I.get<NavigationBackstackNotifier>()],
    routes: [
      GoRoute(path: tabOverlay, builder: (_, __) => const NavOverlayScreen()),
      GoRoute(
        path: copyTradingIntro,
        builder: (_, __) => const CopyTradingIntroScreen(),
      ),
      GoRoute(
        path: copyTradingRiskLevel,
        builder: (_, __) => const CopyTradingRiskLevelScreen(),
      ),
      GoRoute(
        path: copyTradingDashboard,
        builder: (_, __) => const CopyTradingDashboard(),
      ),
    ],
    errorBuilder: (context, state) => const PageNotFoundScreen(),
  );
}
