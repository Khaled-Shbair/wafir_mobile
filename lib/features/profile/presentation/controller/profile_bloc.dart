import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/get_profile_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._getProfileUseCase) : super(ProfileInitial()) {
    on<GetProfileData>(_getProfileData);
  }

  final GetProfileUseCase _getProfileUseCase;

  Future<void> _getProfileData(GetProfileData event, Emitter emit) async {
    emit(ProfileLoading());
    (await _getProfileUseCase.execute()).fold(
      (l) => emit(ProfileLoadedFailure(message: l.message)),
      (r) {
        emit(ProfileLoadedSuccessfully());
      },
    );
  }

  @override
  Future<void> close() {
    disposeGetProfileData();
    return super.close();
  }
}
