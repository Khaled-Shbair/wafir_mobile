import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';
import 'package:wafir_mobile/features/vendors/domain/repository/vendors_repository.dart';

class GetPublicVendorsUseCase implements BaseOutUseCase<VendorsPublicModel> {
  final VendorsRepository _repository;

  GetPublicVendorsUseCase(this._repository);

  @override
  Future<Either<Failure, VendorsPublicModel>> execute() async {
    return await _repository.getPublicVendors();
  }
}

