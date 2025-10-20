import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class TabNavigationCubit extends Cubit<TabNavigationState> {
  TabNavigationCubit() : super(TabNavigationState());

  void changeTab(int index) {
    emit(TabNavigationState(tabIndex: index));
  }
}

class TabNavigationState extends Equatable {
  final int tabIndex;

  const TabNavigationState({this.tabIndex = 0});

  @override
  List<Object> get props => [tabIndex];
}
