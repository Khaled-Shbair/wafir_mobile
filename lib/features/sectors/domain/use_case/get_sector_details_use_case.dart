import 'package:dartz/dartz.dart';
import 'package:wafir_mobile/core/error_handler/error_handler.dart';
import 'package:wafir_mobile/core/use_case/base_use_case.dart';
import 'package:wafir_mobile/features/sectors/domain/model/sector_model.dart';
import 'package:wafir_mobile/features/sectors/domain/repository/sectors_repository.dart';
import 'package:wafir_mobile/features/sectors/data/request/get_sector_details_request.dart';

class GetSectorDetailsUseCaseInput {
  final int sectorId;

  GetSectorDetailsUseCaseInput(this.sectorId);
}

class GetSectorDetailsUseCase
    implements BaseUseCase<GetSectorDetailsUseCaseInput, SectorModel> {
  final SectorsRepository _repository;

  GetSectorDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, SectorModel>> execute(
      GetSectorDetailsUseCaseInput input) async {
    return await _repository
        .getSectorDetails(GetSectorDetailsRequest(sectorId: input.sectorId));
  }
}
