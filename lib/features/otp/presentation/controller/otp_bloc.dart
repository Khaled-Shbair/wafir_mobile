import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({int initialSeconds = 60})
      : _initialSeconds = initialSeconds,
        super(OtpState.initial(initialSeconds: initialSeconds)) {
    on<OtpCodeChanged>(_onCodeChanged);
    on<OtpSubmitted>(_onSubmitted);
    on<OtpResendRequested>(_onResendRequested);
    on<OtpTimerTicked>(_onTimerTicked);
  }

  final int _initialSeconds;
  Timer? _timer;

  void _onCodeChanged(OtpCodeChanged event, Emitter<OtpState> emit) {
    emit(state.copyWith(code: event.code, errorMessage: null));
  }

  Future<void> _onSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
    if (!_isCodeValid(state.code)) {
      emit(state.copyWith(errorMessage: 'Invalid code'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      final success = await _verifyCodeStub(state.code);
      if (success) {
        emit(state.copyWith(isSubmitting: false, isVerified: true));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isVerified: false,
          errorMessage: 'Verification failed',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        isVerified: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onResendRequested(
      OtpResendRequested event, Emitter<OtpState> emit) async {
    if (!state.canResend || state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      await _resendCodeStub();
      _startTimer(emit);
      emit(state.copyWith(
        isSubmitting: false,
        canResend: false,
        secondsRemaining: _initialSeconds,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onTimerTicked(OtpTimerTicked event, Emitter<OtpState> emit) {
    final seconds = event.secondsRemaining;
    if (seconds <= 0) {
      _timer?.cancel();
      emit(state.copyWith(secondsRemaining: 0, canResend: true));
    } else {
      emit(state.copyWith(secondsRemaining: seconds));
    }
  }

  bool _isCodeValid(String code) {
    // Simple 4-digit numeric code validation
    return RegExp(r'^\d{4}$').hasMatch(code);
  }

  Future<bool> _verifyCodeStub(String code) async {
    // Simulate network call
    await Future.delayed(Duration(seconds: 2));
    return code == '1234'; // Stub: only '1234' is a valid code
  }

  Future<void> _resendCodeStub() async {
    // Simulate network call
    await Future.delayed(Duration(seconds: 2));
  }

  void _startTimer(Emitter<OtpState> emit) {
    _timer?.cancel();
    int seconds = _initialSeconds;
    emit(state.copyWith(secondsRemaining: seconds, canResend: false));
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      seconds--;
      emit(state.copyWith(secondsRemaining: seconds));
      if (seconds <= 0) {
        timer.cancel();
        emit(state.copyWith(canResend: true));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
