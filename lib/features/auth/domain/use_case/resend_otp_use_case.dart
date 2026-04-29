import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_otp_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_otp_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class ResendOtpUseCaseInput {
  final String email;
  final String otpType;

  ResendOtpUseCaseInput({
    required this.email,
    required this.otpType,
  });
}

class ResendOtpUseCase
    implements BaseUseCase<ResendOtpUseCaseInput, ResetOtpModel> {
  final AuthRepository _repository;

  ResendOtpUseCase(this._repository);

  @override
  Future<Either<Failure, ResetOtpModel>> execute(
      ResendOtpUseCaseInput input) async {
    return _repository.resetOtp(
      ResetOtpRequest(
        email: input.email,
        otpType: input.otpType,
      ),
    );
  }
}

