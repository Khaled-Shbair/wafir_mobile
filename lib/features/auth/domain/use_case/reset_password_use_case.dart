import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_password_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class ResetPasswordUseCaseInput {
  final String resetToken;
  final String password;

  ResetPasswordUseCaseInput({
    required this.password,
    required this.resetToken,
  });
}

class ResetPasswordUseCase
    implements BaseUseCase<ResetPasswordUseCaseInput, ResetPasswordModel> {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ResetPasswordModel>> execute(
      ResetPasswordUseCaseInput input) async {
    return await _repository.resetPassword(
      ResetPasswordRequest(
        resetToken: input.resetToken,
        password: input.password,
      ),
    );
  }
}
