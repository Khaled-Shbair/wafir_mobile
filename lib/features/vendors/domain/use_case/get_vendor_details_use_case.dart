import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/vendors/data/request/get_vendor_details_request.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendor_model.dart';
import 'package:wafir_mobile/features/vendors/domain/repository/vendors_repository.dart';

class GetVendorDetailsUseCaseInput {
  final int id;

  GetVendorDetailsUseCaseInput(this.id);
}

class GetVendorDetailsUseCase
    implements BaseUseCase<GetVendorDetailsUseCaseInput, VendorModel> {
  final VendorsRepository _repository;

  GetVendorDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, VendorModel>> execute(
      GetVendorDetailsUseCaseInput input) async {
    return await _repository
        .getVendorDetails(GetVendorDetailsRequest(id: input.id));
  }
}
