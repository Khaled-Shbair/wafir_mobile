import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/model/login_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class LoginByGoogleUseCase implements BaseOutUseCase<LoginModel> {
  final AuthRepository _repository;

  LoginByGoogleUseCase(this._repository);

  @override
  Future<Either<Failure, LoginModel>> execute() async {
    return await _repository.loginByGoogle();
  }
}
