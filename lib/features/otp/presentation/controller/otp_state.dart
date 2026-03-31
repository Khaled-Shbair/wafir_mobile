part of 'otp_bloc.dart';

class OtpState {
  final String code;
  final bool isSubmitting;
  final bool canResend;
  final int secondsRemaining;
  final String? errorMessage;
  final bool isVerified;

  const OtpState({
    required this.code,
    required this.isSubmitting,
    required this.canResend,
    required this.secondsRemaining,
    required this.errorMessage,
    required this.isVerified,
  });

  factory OtpState.initial({required int initialSeconds}) {
    return OtpState(
      code: '',
      isSubmitting: false,
      canResend: false,
      secondsRemaining: initialSeconds,
      errorMessage: null,
      isVerified: false,
    );
  }

  OtpState copyWith({
    String? code,
    bool? isSubmitting,
    bool? canResend,
    int? secondsRemaining,
    String? errorMessage,
    bool? isVerified,
  }) {
    return OtpState(
      code: code ?? this.code,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      canResend: canResend ?? this.canResend,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      errorMessage: errorMessage,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}

