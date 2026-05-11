import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/logout_use_case.dart';

part 'logout_setting_event.dart';

part 'logout_setting_state.dart';

class LogoutSettingBloc extends Bloc<LogoutSettingEvent, LogoutSettingState> {
  LogoutSettingBloc(this._logoutUseCase) : super(const LogoutSettingInitial()) {
    on<LogoutProcess>(_onLogoutProcess);
  }

  final LogoutUseCase _logoutUseCase;

  Future<void> _onLogoutProcess(LogoutProcess event, Emitter emit) async {
    emit(const LogoutSettingLoading());
    final result = await _logoutUseCase.execute();
    result.fold(
      (f) => emit(LogoutSettingFailure(message: f.message)),
      (r) => emit(const LogoutSettingSuccess()),
    );
  }
}
