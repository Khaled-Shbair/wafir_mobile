import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/change_password_use_case.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordInitial()) {
    on<ToggleCurrentPasswordVisibility>(_onToggleCurrentPasswordVisibility);
    on<ToggleNewPasswordVisibility>(_onToggleNewPasswordVisibility);
    on<ToggleConfirmPasswordVisibility>(_onToggleConfirmPasswordVisibility);
    on<ChangePasswordProcess>(_resetPasswordProcess);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void _onToggleCurrentPasswordVisibility(ToggleCurrentPasswordVisibility event,
      Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(
        currentPasswordObscured: !state.currentPasswordObscured));
  }

  void _onToggleNewPasswordVisibility(
      ToggleNewPasswordVisibility event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(newPasswordObscured: !state.newPasswordObscured));
  }

  void _onToggleConfirmPasswordVisibility(ToggleConfirmPasswordVisibility event,
      Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(
        confirmPasswordObscured: !state.confirmPasswordObscured));
  }

  Future<void> _resetPasswordProcess(
      ChangePasswordProcess event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordLoading());
    if (formKey.currentState!.validate()) {
      (
        await instance<ChangePasswordUseCase>().execute(
          ChangePasswordUseCaseInput(
            newPassword: event.newPassword,
            currentPassword: event.currentPassword,
          ),
        )
          ..fold(
            (l) {
              emit(ChangePasswordFailure(message: l.message));
            },
            (r) {
              emit(ChangePasswordSuccess(message: r.message));
            },
          ),
      );
    }
  }

  @override
  Future<void> close() {
    disposeResetPassword();
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    return super.close();
  }
}
