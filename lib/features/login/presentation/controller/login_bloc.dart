import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginProcess>(_loginProcess);
    on<LoginByGoogle>(_loginByGoogle);
    on<ToggleRememberMe>(_toggleRememberMe);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

  final TapGestureRecognizer forgetPassword = TapGestureRecognizer();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _loginProcess(LoginProcess event, Emitter emit) async {
    // if (formKey.currentState!.validate()) {
    //   emit(LoginLoading());
    //   await Future.delayed(const Duration(seconds: 2));
    //   emit(LoginSuccessfully());
    // }
  }

  void _loginByGoogle(LoginByGoogle event, Emitter emit) async {
    // emit(LoginLoading());
    // await Future.delayed(const Duration(seconds: 2));
    // emit(LoginSuccessfully());
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
    forgetPassword.dispose();
    return super.close();
  }
}
