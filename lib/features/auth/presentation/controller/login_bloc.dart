import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/login_by_google_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginByGoogleUseCase, this._loginByEmailUseCase)
      : super(LoginInitial()) {
    on<LoginProcess>(_loginProcess);
    on<LoginByGoogle>(_loginByGoogle);
    on<ToggleRememberMe>(_toggleRememberMe);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

  final LoginByEmailUseCase _loginByEmailUseCase;
  final LoginByGoogleUseCase _loginByGoogleUseCase;
  final TapGestureRecognizer createAccount = TapGestureRecognizer();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _loginProcess(LoginProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      (await _loginByEmailUseCase.execute(
        LoginByEmailUseCaseInput(
          email: email.text,
          password: password.text,
        ),
      )
        ..fold(
          (f) {
            emit(LoginFailure(f.message));
          },
          (r) {
            emit(LoginSuccessfully());
          },
        ));
    }
  }

  void _loginByGoogle(LoginByGoogle event, Emitter emit) async {
    emit(LoginLoading());
    (await _loginByGoogleUseCase.execute()
      ..fold(
        (f) {
          emit(LoginFailure(f.message));
        },
        (r) {
          emit(LoginSuccessfully());
        },
      ));
  }

  void _toggleRememberMe(ToggleRememberMe event, Emitter emit) {
    emit(state.copyWith(rememberMe: event.value));
  }

  void _togglePasswordVisibility(TogglePasswordVisibility event, Emitter emit) {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }

  @override
  Future<void> close() {
    email.clear();
    password.dispose();
    createAccount.dispose();
    disposeLogin();
    return super.close();
  }
}
