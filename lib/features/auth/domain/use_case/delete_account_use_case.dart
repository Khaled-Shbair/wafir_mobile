import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/change_password_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/reset_password_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class DeleteAccountUseCase implements BaseOutUseCase<String> {
  final AuthRepository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute() async {
    return await _repository.deleteAccount();
  }
}
