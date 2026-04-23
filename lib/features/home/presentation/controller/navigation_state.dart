part of 'navigation_cubit.dart';

class NavigationState {
  final int selectedIndex;
  final int offersSearchFocusRequestId;

  const NavigationState({
    required this.selectedIndex,
    this.offersSearchFocusRequestId = 0,
  });

  NavigationState copyWith({
    int? selectedIndex,
    int? offersSearchFocusRequestId,
  }) {
    return NavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      offersSearchFocusRequestId:
          offersSearchFocusRequestId ?? this.offersSearchFocusRequestId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationState &&
          runtimeType == other.runtimeType &&
          selectedIndex == other.selectedIndex &&
          offersSearchFocusRequestId == other.offersSearchFocusRequestId;

  @override
  int get hashCode => Object.hash(selectedIndex, offersSearchFocusRequestId);
}
