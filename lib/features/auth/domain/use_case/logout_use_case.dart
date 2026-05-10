import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class LogoutUseCase implements BaseUseCase<void, void> {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(void input) async {
    return await _repository.logout();
  }
}

