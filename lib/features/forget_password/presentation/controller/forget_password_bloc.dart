import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(const ForgetPasswordInitial()) {
    on<EmailChanged>(_onEmailChanged);
    on<SubmitForgetPassword>(_onSubmitForgetPassword);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  void _onEmailChanged(EmailChanged event, Emitter<ForgetPasswordState> emit) {
    emit(state.copyWith(email: event.value));
  }

  Future<void> _onSubmitForgetPassword(
      SubmitForgetPassword event, Emitter<ForgetPasswordState> emit) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    emit(ForgetPasswordLoading.fromState(state));

    try {
      await _sendResetLink(emailController.text.trim());
      emit(ForgetPasswordSuccess.fromState(state));
    } catch (e) {
      emit(ForgetPasswordFailure.fromState(
        state,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _sendResetLink(String email) async {
    // TODO: integrate with real backend to send reset link
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}

