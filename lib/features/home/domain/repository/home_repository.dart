import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHomeData();
}

