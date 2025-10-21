import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:roqu_copy_trader/src/core/services/navigation_backstack_notifier.dart';
import 'package:roqu_copy_trader/src/core/widgets/page_not_found_screen.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/pages/nav_overlay_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/confirm_transaction_pin_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/confirm_transaction_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/copy_success_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/copy_trading_dashboard.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/copy_trading_intro_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/copy_trading_risk_level_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/enter_amount_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/my_dashboard_screen.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/pages/pro_trader_detail_screen.dart';

class AppRoutes {
  static const tabOverlay = '/';
  static const copyTradingIntro = '/copy-trading-intro';
  static const copyTradingRiskLevel = '/copy-trading-risk-level';
  static const copyTradingDashboard = '/copy-trading-dashboard';
  static const proTraderDetails = '/pro-trader-details';
  static const myDashboard = '/my-dashboard';
  static const enterAmount = '/enter-amount';
  static const copySuccess = '/copy-success';
  static const enterTransactionPin = '/enter-transaction-pin';
  static const confirmTransaction = '/confirm-transaction';

  static final GoRouter router = GoRouter(
    observers: [GetIt.I.get<NavigationBackstackNotifier>()],
    routes: [
      GoRoute(path: tabOverlay, builder: (_, __) => const NavOverlayScreen()),
      GoRoute(
        path: copyTradingIntro,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const CopyTradingIntroScreen()),
      ),
      GoRoute(
        path: copyTradingRiskLevel,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const CopyTradingRiskLevelScreen()),
      ),
      GoRoute(
        path: copyTradingDashboard,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const CopyTradingDashboard()),
      ),
      GoRoute(
        path: proTraderDetails,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const ProTraderDetailScreen()),
      ),
      GoRoute(
        path: myDashboard,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const MyDashboardScreen()),
      ),
      GoRoute(
        path: enterAmount,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const EnterAmountScreen()),
      ),
      GoRoute(
        path: enterTransactionPin,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const ConfirmTransactionPinScreen()),
      ),
      GoRoute(
        path: confirmTransaction,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const ConfirmTransactionScreen()),
      ),
      GoRoute(
        path: copySuccess,
        pageBuilder: (context, state) =>
            fadePageBuilder(state, const CopySuccessScreen()),
      ),
    ],
    errorPageBuilder: (context, state) =>
        fadePageBuilder(state, const PageNotFoundScreen()),
  );

  static fadePageBuilder(GoRouterState state, Widget child) {
    return CustomTransitionPage(
      transitionDuration: Duration(milliseconds: 500),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
