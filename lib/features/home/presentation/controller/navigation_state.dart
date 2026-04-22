part of 'navigation_cubit.dart';

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

