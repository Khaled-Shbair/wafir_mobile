import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/vendors/data/request/get_vendor_details_request.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendor_model.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';

abstract class VendorsRepository {
  Future<Either<Failure, VendorModel>> getVendorDetails(
      GetVendorDetailsRequest request);
  Future<Either<Failure, VendorsPublicModel>> getPublicVendors();
}
