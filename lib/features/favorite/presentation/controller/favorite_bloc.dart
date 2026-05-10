import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
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
      (r) => emit(
        FavoriteLoaded(
          favorites: r,
          message: event.message,
          toggledOfferId: event.offerId,
          isFavorited: true, // يتم تعيينه عند إضافة المفضلة
        ),
      ),
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
        // Emit state with toggled offerId and isFavorited status
        if (previousState is FavoriteLoaded) {
          // If the offer was unfavorited, remove it from the current list so the
          // favorites screen updates immediately. If it was favorited, keep
          // the current list (it should already contain the item) —
          // re-fetching would be heavier.
          final currentItems = previousState.favorites.items;
          final bool nowFavorited = r.isFavorited;

          final updatedItems = nowFavorited
              ? currentItems
              : currentItems.where((i) => i.offerId != event.offerId).toList();

          emit(FavoriteLoaded(
            favorites: previousState.favorites,
            message: r.message,
            toggledOfferId: event.offerId,
            isFavorited: nowFavorited,
          ));

          // Emit a second FavoriteLoaded with the updated items list so UI reads it
          emit(FavoriteLoaded(
            favorites: OffersModel(items: updatedItems, totalCount: updatedItems.length),
            message: r.message,
            toggledOfferId: event.offerId,
            isFavorited: nowFavorited,
          ));
        } else {
          // Fetch all favorites to update the list
          add(GetFavoriteOffers(message: r.message, offerId: event.offerId));
        }
      },
    );
  }


}
