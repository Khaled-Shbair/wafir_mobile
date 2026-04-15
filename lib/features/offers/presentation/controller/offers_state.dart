part of 'offers_bloc.dart';

@immutable
abstract class OffersState {}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {
  final OffersModel offers;

  OffersLoaded({required this.offers});
}

class OffersFailure extends OffersState {
  final String message;

  OffersFailure({required this.message});
}

