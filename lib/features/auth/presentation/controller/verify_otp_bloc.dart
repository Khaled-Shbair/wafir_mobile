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

  final formKey = GlobalKey<FormState>();
  final VerifyOtpUseCase _useCase;

  void _verifyOtpProcess(VerifyOtpProcess event, Emitter emit) async {
    if (event.otp.isNotEmpty) {
      emit(VerifyOtpLoading());
      (await _useCase.execute(VerifyOtpUseCaseInput(
        email: event.email,
        otp: event.otp,
      type: event.type,
      ))
        ..fold(
          (f) => emit(VerifyOtpFailure(f.message)),
          (r) => emit(VerifyOtpSuccess()),
        ));
    } else {
      emit(VerifyOtpFailure(ManagerStrings.pleaseEnterOtp));
    }
  }

  @override
  Future<void> close() {
    disposeVerifyOtp();

    return super.close();
  }
}
