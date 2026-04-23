import 'package:flutter_bloc/flutter_bloc.dart';

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

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(selectedIndex: 0));

  void selectTab(int index) {
    if (state.selectedIndex != index) {
      emit(state.copyWith(selectedIndex: index));
    }
  }

  void goToHome() => selectTab(0);

  void goToOffers({bool focusSearch = false}) {
    if (focusSearch) {
      emit(
        state.copyWith(
          selectedIndex: 1,
          offersSearchFocusRequestId: state.offersSearchFocusRequestId + 1,
        ),
      );
      return;
    }
    selectTab(1);
  }

  void goToFavorites() => selectTab(2);
  void goToSettings() => selectTab(3);
}
