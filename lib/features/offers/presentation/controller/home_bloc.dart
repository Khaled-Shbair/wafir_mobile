import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/sectors/domain/model/sector_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetAllSectors>(_getAllSectors);
  }


  Future<void> _getAllSectors(
      GetAllSectors event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    // (await _getAllSectorsUseCase.execute()).fold(
    //   (failure) => emit(HomeLoadedFailure(message: failure.message)),
    //   (result) => emit(
    //     HomeLoadedSuccessfully(sectors: result.data),
    //   ),
    // );
  }

  @override
  Future<void> close() {
    disposeHome();
    return super.close();
  }
}
