import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/verify_otp_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/verify_otp_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class VerifyOtpUseCaseInput {
  final String email;
  final String otp;
  final String type;

  VerifyOtpUseCaseInput({
    required this.email,
    required this.otp,
    required this.type,
  });
}

class VerifyOtpUseCase
    implements BaseUseCase<VerifyOtpUseCaseInput, VerifyOtpModel> {
  final AuthRepository _repository;

  VerifyOtpUseCase(this._repository);

  @override
  Future<Either<Failure, VerifyOtpModel>> execute(
      VerifyOtpUseCaseInput input) async {
    return await _repository.verifyOtp(
      VerifyOtpRequest(
        email: input.email,
        otp: input.otp,
        type: input.type,
      ),
    );
  }
}
