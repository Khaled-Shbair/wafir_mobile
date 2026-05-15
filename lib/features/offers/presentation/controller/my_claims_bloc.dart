import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/features/offers/domain/model/my_claims_model.dart';
import 'package:wafir_mobile/features/offers/domain/use_case/get_my_claims_use_case.dart';

part 'my_claims_event.dart';
part 'my_claims_state.dart';

class MyClaimsBloc extends Bloc<MyClaimsEvent, MyClaimsState> {
  final GetMyClaimsUseCase _getMyClaimsUseCase;

  MyClaimsBloc(this._getMyClaimsUseCase) : super(MyClaimsInitial()) {
    on<GetMyClaimsEvent>(_onGetMyClaimsEvent);
  }

  Future<void> _onGetMyClaimsEvent(
    GetMyClaimsEvent event,
    Emitter<MyClaimsState> emit,
  ) async {
    emit(MyClaimsLoading());

    final result = await _getMyClaimsUseCase.execute(null);

    result.fold(
      (failure) => emit(MyClaimsFailure(failure.message)),
      (claims) => emit(MyClaimsLoaded(claims)),
    );
  }
}

