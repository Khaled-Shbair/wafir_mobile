import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/forgot_password_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/forgot_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class ForgotPasswordUseCaseInput {
  String email;

  ForgotPasswordUseCaseInput({
    required this.email,
  });
}

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordUseCaseInput, ForgotPasswordModel> {
  final AuthRepository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgotPasswordModel>> execute(
      ForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(
      ForgotPasswordRequest(email: input.email),
    );
  }
}
