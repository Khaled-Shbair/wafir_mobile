import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/forgot_password_use_case.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc(this._forgotPasswordUseCase)
      : super(ForgetPasswordInitial()) {
    on<ForgotPasswordProcess>(_forgotPasswordProcess);
  }

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final formKey = GlobalKey<FormState>();

  void _forgotPasswordProcess(ForgotPasswordProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoading());
      (await _forgotPasswordUseCase
              .execute(ForgotPasswordUseCaseInput(email: event.email)))
          .fold(
        (l) {
          emit(ForgetPasswordFailure(l.message));
        },
        (r) {
          emit(ForgetPasswordSuccess(event.email));
        },
      );
    }
  }

  @override
  Future<void> close() {
    disposeForgetPassword();
    return super.close();
  }
}
