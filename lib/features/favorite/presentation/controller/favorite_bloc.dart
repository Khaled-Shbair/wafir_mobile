import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/favorite/domain/model/favorite_offers_model.dart';
import 'package:wafir_mobile/features/favorite/domain/use_case/get_all_favorite_offers_use_case.dart';
import 'package:wafir_mobile/features/favorite/domain/use_case/toggle_favorite_offer_use_case.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetAllFavoriteOffersUseCase _getAllFavoriteOffersUseCase;
  final ToggleFavoriteOfferUseCase _toggleFavoriteOfferUseCase;

  FavoriteBloc(
    this._getAllFavoriteOffersUseCase,
    this._toggleFavoriteOfferUseCase,
  ) : super(FavoriteInitial()) {
    on<GetFavoriteOffers>(_onGetFavoriteOffers);
    on<ToggleFavoriteOfferEvent>(_onToggleFavoriteOffer);
  }

  Future<void> _onGetFavoriteOffers(
      GetFavoriteOffers event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    (await _getAllFavoriteOffersUseCase.execute()).fold(
      (f) => emit(FavoriteFailure(message: f.message)),
      (r) => emit(FavoriteLoaded(favorites: r)),
    );
  }

  Future<void> _onToggleFavoriteOffer(
      ToggleFavoriteOfferEvent event, Emitter<FavoriteState> emit) async {
    //store the current state before emitting the loading state
    final previousState = state;

    final input = ToggleFavoriteOfferUseCaseInput(offerId: event.offerId);

    (await _toggleFavoriteOfferUseCase.execute(input)).fold(
      (f) {
        emit(FavoriteFailure(message: f.message));
        // return to the previous state so that the content does not disappear completely
        if (previousState is FavoriteLoaded) {
          emit(previousState);
        }
      },
      (r) {
        // add or remove offerId from the current list of favorites in the state
        add(GetFavoriteOffers());
      },
    );
  }

  @override
  Future<void> close() {
    disposeFavorite();
    return super.close();
  }
}
