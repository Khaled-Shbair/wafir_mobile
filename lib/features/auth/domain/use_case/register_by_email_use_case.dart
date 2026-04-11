import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/auth/data/request/register_request.dart';
import 'package:wafir_mobile/features/auth/domain/model/register_response.dart';
import 'package:wafir_mobile/features/auth/domain/repository/auth_repository.dart';

class RegisterByEmailUseCaseInput {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String governorate;
  final String city;

  RegisterByEmailUseCaseInput({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.governorate,
    required this.city,
  });
}

class RegisterByEmailUseCase
    implements BaseUseCase<RegisterByEmailUseCaseInput, RegisterModel> {
  final AuthRepository _repository;

  RegisterByEmailUseCase(this._repository);

  @override
  Future<Either<Failure, RegisterModel>> execute(
      RegisterByEmailUseCaseInput input) async {
    return await _repository.registerByEmail(
      RegisterByEmailRequest(
        email: input.email,
        password: input.password,
        firstName: input.firstName,
        lastName: input.lastName,
        phoneNumber: input.phoneNumber,
        governorate: input.governorate,
        city: input.city,
      ),
    );
  }
}
