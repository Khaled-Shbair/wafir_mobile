import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/vendors/data/request/get_all_vendors_request.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';
import 'package:wafir_mobile/features/vendors/domain/repository/vendors_repository.dart';

class GetAllVendorsInput {
  final int? page;
  final String? searchQuery;

  GetAllVendorsInput({
    this.page,
    this.searchQuery,
  });
}

class GetPublicVendorsUseCase
    implements BaseUseCase<GetAllVendorsInput, VendorsPublicModel> {
  final VendorsRepository _repository;

  GetPublicVendorsUseCase(this._repository);

  @override
  Future<Either<Failure, VendorsPublicModel>> execute(
      GetAllVendorsInput input) async {
    return await _repository.getPublicVendors(
      GetAllVendorsRequest(
        page: input.page,
        searchQuery: input.searchQuery,
      ),
    );
  }
}
