import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_model.dart';
import 'package:wafir_mobile/features/profile/domain/repository/profile_repository.dart';

class GetProfileUseCase implements BaseOutUseCase<ProfileModel> {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<Either<Failure, ProfileModel>> execute() async {
    return await _repository.getProfile();
  }
}

