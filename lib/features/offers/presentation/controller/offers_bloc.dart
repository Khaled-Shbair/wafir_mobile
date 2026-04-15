import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/offers/domain/model/offers_model.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_all_offers_use_case.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  final GetAllOffersUseCase _getAllOffersUseCase;

  OffersBloc(this._getAllOffersUseCase) : super(OffersInitial()) {
    on<GetAllOffersEvent>(_onGetAllOffers);
  }

  Future<void> _onGetAllOffers(
      GetAllOffersEvent event, Emitter<OffersState> emit) async {
    emit(OffersLoading());
    (await _getAllOffersUseCase.execute()).fold(
      (failure) => emit(OffersFailure(message: failure.message)),
      (result) => emit(OffersLoaded(offers: result)),
    );
  }

  @override
  Future<void> close() {
    disposeOffers();
    return super.close();
  }
}

