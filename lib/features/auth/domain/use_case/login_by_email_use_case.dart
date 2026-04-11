import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/login_by_email_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/login_model.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class LoginByEmailUseCaseInput {
  String email;
  String password;

  LoginByEmailUseCaseInput({
    required this.email,
    required this.password,
  });
}

class LoginByEmailUseCase
    implements BaseUseCase<LoginByEmailUseCaseInput, LoginModel> {
  final AuthRepository _repository;

  LoginByEmailUseCase(this._repository);

  @override
  Future<Either<Failure, LoginModel>> execute(
      LoginByEmailUseCaseInput input) async {
    return await _repository.loginByEmail(
      LoginByEmailRequest(
        email: input.email,
        password: input.password,
      ),
    );
  }
}
