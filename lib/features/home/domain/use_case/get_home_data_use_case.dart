import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';
import 'package:wafir_mobile/features/home/domain/repository/home_repository.dart';

class GetHomeDataUseCase implements BaseOutUseCase<HomeModel> {
  final HomeRepository _repository;

  GetHomeDataUseCase(this._repository);

  @override
  Future<Either<Failure, HomeModel>> execute() async {
    return await _repository.getHomeData();
  }
}

