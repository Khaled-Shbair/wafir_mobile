part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadedSuccessfully extends HomeState {
  final List<SectorModel> sectors;

  HomeLoadedSuccessfully({required this.sectors});
}

class HomeLoadedFailure extends HomeState {
  final String message;

  HomeLoadedFailure({required this.message});
}


