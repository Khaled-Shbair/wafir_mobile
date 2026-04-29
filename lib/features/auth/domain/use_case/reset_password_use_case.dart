import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/reset_password_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class ResetPasswordUseCaseInput {
  final String currentPassword;
  final String newPassword;

  ResetPasswordUseCaseInput({
    required this.currentPassword,
    required this.newPassword,
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
        currentPassword    : input.currentPassword,
      newPassword: input.newPassword,
      ),
    );
  }
}
