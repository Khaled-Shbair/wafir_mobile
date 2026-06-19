import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/delete_account_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/logout_use_case.dart';

part 'logout_setting_event.dart';

part 'logout_setting_state.dart';

class LogoutSettingBloc extends Bloc<LogoutSettingEvent, LogoutSettingState> {
  LogoutSettingBloc(this._logoutUseCase,this._deleteAccountUseCase) : super(const LogoutSettingInitial()) {
    on<LogoutProcess>(_onLogoutProcess);
    on<DeleteAccountProcess>(_onDeleteAccountProcess);
  }

  final LogoutUseCase _logoutUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;

  Future<void> _onLogoutProcess(LogoutProcess event, Emitter emit) async {
    emit(const LogoutSettingLoading());
    final result = await _logoutUseCase.execute();
    result.fold(
      (f) => emit(LogoutSettingFailure(message: f.message)),
      (r) => emit(const LogoutSettingSuccess()),
    );
  } Future<void> _onDeleteAccountProcess(DeleteAccountProcess event, Emitter emit) async {
    emit(const LogoutSettingLoading());
    final result = await _deleteAccountUseCase.execute();
    result.fold(
          (f) => emit(LogoutSettingFailure(message: f.message)),
          (r) => emit( DeleteAccountSuccess(message:r)),
    );
  }
}
