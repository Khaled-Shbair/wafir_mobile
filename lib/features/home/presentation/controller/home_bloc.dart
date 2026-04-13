import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/home/domain/model/home_models.dart';
import 'package:wafir_mobile/features/home/domain/use_case/get_home_data_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase _getHomeDataUseCase;

  HomeBloc(this._getHomeDataUseCase) : super(HomeInitial()) {
    on<GetHomeData>(_getHomeData);
  }

  Future<void> _getHomeData(GetHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    (await _getHomeDataUseCase.execute()).fold(
      (failure) => emit(HomeLoadedFailure(message: failure.message)),
      (result) => emit(
        HomeLoadedSuccessfully(home: result),
      ),
    );
  }

  @override
  Future<void> close() {
    disposeHome();
    return super.close();
  }
}
