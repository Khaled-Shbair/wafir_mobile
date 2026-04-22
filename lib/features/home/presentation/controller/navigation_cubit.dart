import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationState {
  final int selectedIndex;

  const NavigationState({
    required this.selectedIndex,
  });

  NavigationState copyWith({
    int? selectedIndex,
  }) {
    return NavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationState &&
          runtimeType == other.runtimeType &&
          selectedIndex == other.selectedIndex;

  @override
  int get hashCode => selectedIndex.hashCode;
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(selectedIndex: 0));

  void selectTab(int index) {
    if (state.selectedIndex != index) {
      emit(NavigationState(selectedIndex: index));
    }
  }

  void goToHome() => selectTab(0);
  void goToOffers() => selectTab(1);
  void goToFavorites() => selectTab(2);
  void goToSettings() => selectTab(3);
}
