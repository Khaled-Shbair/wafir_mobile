import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordInitial()) {
    on<CurrentPasswordChanged>(_onCurrentPasswordChanged);
    on<NewPasswordChanged>(_onNewPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ToggleCurrentPasswordVisibility>(_onToggleCurrentPasswordVisibility);
    on<ToggleNewPasswordVisibility>(_onToggleNewPasswordVisibility);
    on<ToggleConfirmPasswordVisibility>(_onToggleConfirmPasswordVisibility);
    on<SubmitChangePassword>(_onSubmitChangePassword);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _onCurrentPasswordChanged(
      CurrentPasswordChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(currentPassword: event.value));
  }

  void _onNewPasswordChanged(
      NewPasswordChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(newPassword: event.value));
  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(confirmPassword: event.value));
  }

  void _onToggleCurrentPasswordVisibility(ToggleCurrentPasswordVisibility event,
      Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(
        currentPasswordObscured: !state.currentPasswordObscured));
  }

  void _onToggleNewPasswordVisibility(ToggleNewPasswordVisibility event,
      Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(newPasswordObscured: !state.newPasswordObscured));
  }

  void _onToggleConfirmPasswordVisibility(
      ToggleConfirmPasswordVisibility event,
      Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(
        confirmPasswordObscured: !state.confirmPasswordObscured));
  }

  Future<void> _onSubmitChangePassword(
      SubmitChangePassword event, Emitter<ChangePasswordState> emit) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    emit(ChangePasswordLoading.fromState(state));

    try {
      // TODO: integrate with real auth repository to change password
      await Future.delayed(const Duration(seconds: 1));
      emit(ChangePasswordSuccess.fromState(state));
    } catch (e) {
      emit(ChangePasswordFailure.fromState(
        state,
        errorMessage: e.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
