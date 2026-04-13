part of 'sector_details_bloc.dart';

sealed class SectorDetailsEvent {}

class GetSectorDetails extends SectorDetailsEvent {
  final int sectorId;

  GetSectorDetails(this.sectorId);
}
