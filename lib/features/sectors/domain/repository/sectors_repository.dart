import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/features/sectors/domain/model/sector_model.dart';
import 'package:wafir_mobile/features/sectors/data/request/get_sector_details_request.dart';

abstract class SectorsRepository {
  Future<Either<Failure, SectorModel>> getSectorDetails(
      GetSectorDetailsRequest request);
}
