import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/model/register_response.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class RegisterByGoogleUseCase implements BaseOutUseCase<RegisterModel> {
  final AuthRepository _repository;

  RegisterByGoogleUseCase(this._repository);

  @override
  Future<Either<Failure, RegisterModel>> execute() async {
    return await _repository.registerByGoogle();
  }
}
