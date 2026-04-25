import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/reset_password_use_case.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordInitial()) {
    on<ToggleCurrentPasswordVisibility>(_onToggleCurrentPasswordVisibility);
    on<ToggleNewPasswordVisibility>(_onToggleNewPasswordVisibility);
    on<ToggleConfirmPasswordVisibility>(_onToggleConfirmPasswordVisibility);
    on<ResetPasswordProcess>(_resetPasswordProcess);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void _onToggleCurrentPasswordVisibility(
      ToggleCurrentPasswordVisibility event, Emitter<ResetPasswordState> emit) {
    emit(state.copyWith(
        currentPasswordObscured: !state.currentPasswordObscured));
  }

  void _onToggleNewPasswordVisibility(
      ToggleNewPasswordVisibility event, Emitter<ResetPasswordState> emit) {
    emit(state.copyWith(newPasswordObscured: !state.newPasswordObscured));
  }

  void _onToggleConfirmPasswordVisibility(
      ToggleConfirmPasswordVisibility event, Emitter<ResetPasswordState> emit) {
    emit(state.copyWith(
        confirmPasswordObscured: !state.confirmPasswordObscured));
  }

  Future<void> _resetPasswordProcess(
      ResetPasswordProcess event, Emitter<ResetPasswordState> emit) async {
    if (formKey.currentState!.validate()) {
      (
        await instance<ResetPasswordUseCase>().execute(
          ResetPasswordUseCaseInput(
            password: newPassword.text,
            resetToken: event.resetToken,
          ),
         )
          ..fold(
            (l) {
              emit(ResetPasswordFailure(message: l.message));
            },
            (r) {
              emit(ResetPasswordSuccess());
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
