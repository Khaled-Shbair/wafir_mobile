part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoadedSuccessfully extends ProfileState {}

class ProfileLoadedFailure extends ProfileState {
  final String message;

  ProfileLoadedFailure({required this.message});
}
