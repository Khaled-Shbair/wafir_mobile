part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final FavoriteOffersModel favorites;

  FavoriteLoaded({required this.favorites});
}

class FavoriteFailure extends FavoriteState {
  final String message;

  FavoriteFailure({required this.message});
}

