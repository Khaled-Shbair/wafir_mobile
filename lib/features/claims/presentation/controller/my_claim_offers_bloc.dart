import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/model/offers_model.dart';
import 'package:wafir_mobile/features/claims/domain/model/my_claim_offers_model.dart';
import 'package:wafir_mobile/features/claims/domain/use_case/get_my_claim_offers_use_case.dart';

part 'my_claim_offers_event.dart';

part 'my_claim_offers_state.dart';

class MyClaimOffersBloc extends Bloc<MyClaimOffersEvent, MyClaimOffersState> {
  MyClaimOffersBloc(this._useCase) : super(MyClaimOffersInitial()) {
    on<MyClaimOffersEvent>(_getMyClaimsEvent);
  }

  final GetMyClaimOffersUseCase _useCase;

  Future<void> _getMyClaimsEvent(MyClaimOffersEvent event, Emitter emit) async {
    emit(MyClaimOffersLoading());
    (await _useCase.execute()).fold(
      (l) {
        emit(MyClaimOffersFailed(l.message));
      },
      (r) {
        emit(MyClaimOffersSuccessfully(r.data));
      },
    );
  }
}
