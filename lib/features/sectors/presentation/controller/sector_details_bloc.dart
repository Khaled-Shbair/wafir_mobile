import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/features/sectors/domain/use_case/get_sector_details_use_case.dart';

part 'sector_details_event.dart';

part 'sector_details_state.dart';

class SectorDetailsBloc extends Bloc<SectorDetailsEvent, SectorDetailsState> {
  SectorDetailsBloc(this._useCase) : super(SectorDetailsInitial()) {
    on<SectorDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final GetSectorDetailsUseCase _useCase;
}
