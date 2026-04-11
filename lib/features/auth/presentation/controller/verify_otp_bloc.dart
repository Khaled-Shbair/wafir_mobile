import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/verify_otp_use_case.dart';

part 'verify_otp_event.dart';

part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc(this._useCase) : super(VerifyOtpInitial()) {
    on<VerifyOtpProcess>(_verifyOtpProcess);
  }

  final TextEditingController c1 = TextEditingController();
  final TextEditingController c2 = TextEditingController();
  final TextEditingController c3 = TextEditingController();
  final TextEditingController c4 = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  final formKey = GlobalKey<FormState>();
  final VerifyOtpUseCase _useCase;

  void _verifyOtpProcess(VerifyOtpProcess event, Emitter emit) async {
    if (event.email.isNotEmpty) {
      emit(VerifyOtpLoading());
      (await _useCase.execute(
        VerifyOtpUseCaseInput(
          email: event.email,
          otp: c1.text + c2.text + c3.text + c4.text,
        ),
      )
        ..fold(
          (f) {
            emit(VerifyOtpFailure(f.message));
          },
          (r) {
            emit(VerifyOtpSuccess());
          },
        ));
    } else {
      emit(VerifyOtpFailure(ManagerStrings.pleaseEnterOtp));
    }
  }

  @override
  Future<void> close() {
    disposeVerifyOtp();
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
    return super.close();
  }
}
