part of 'my_claims_bloc.dart';

abstract class MyClaimsState {}

class MyClaimsInitial extends MyClaimsState {}

class MyClaimsLoading extends MyClaimsState {}

class MyClaimsLoaded extends MyClaimsState {
  final MyClaimsModel claims;

  MyClaimsLoaded(this.claims);
}

class MyClaimsFailure extends MyClaimsState {
  final String message;

  MyClaimsFailure(this.message);
}

