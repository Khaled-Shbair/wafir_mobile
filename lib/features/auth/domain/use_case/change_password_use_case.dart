import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/change_password_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class ChangePasswordUseCaseInput {
  final String currentPassword;
  final String newPassword;

  ChangePasswordUseCaseInput({
    required this.currentPassword,
    required this.newPassword,
  });
}

class ChangePasswordUseCase
    implements BaseUseCase<ChangePasswordUseCaseInput, ResetPasswordModel> {
  final AuthRepository _repository;

  ChangePasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ResetPasswordModel>> execute(
      ChangePasswordUseCaseInput input) async {
    return await _repository.changePassword(
      ChangePasswordRequest(
        currentPassword: input.currentPassword,
        newPassword: input.newPassword,
      ),
    );
  }
}
