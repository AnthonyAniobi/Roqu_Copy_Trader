import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roqu_copy_trader/src/core/extensions/num_extension.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/pages/home_screen.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/cubit/tab_navigation_cubit.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/widgets/custom_navbar_widget.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/widgets/more_options_widget.dart';

class NavOverlayScreen extends StatefulWidget {
  const NavOverlayScreen({super.key});

  @override
  State<NavOverlayScreen> createState() => _NavOverlayScreenState();
}

class _NavOverlayScreenState extends State<NavOverlayScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int selectedIndex = 0;
  bool groupOpened = false;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // AppUtils.tabController = PersistentTabController(initialIndex: 0);
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      context.read<TabNavigationCubit>().changeTab(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabNavigationCubit, TabNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [HomeScreen(), Container(), Container(), Container()],
              );
            },
          ),
          bottomNavigationBar: CustomNavBarWidget(
            selectedIndex: state.tabIndex,
            onItemSelected: (idx) {
              _tabController.animateTo(idx, duration: 500.milliseconds);
              context.read<TabNavigationCubit>().changeTab(idx);
            },
            onCenterTap: () {
              MoreOptionsWidget.show(context);
            },
          ),
        );
      },
    );
  }
}
