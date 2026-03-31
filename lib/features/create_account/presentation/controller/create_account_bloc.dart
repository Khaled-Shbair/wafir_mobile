import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_account_event.dart';

part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(const CreateAccountInitial()) {
    on<AcceptedCreate>(_acceptedCreate);
    on<GovernorateChanged>(_governorateChanged);
    on<CityChanged>(_cityChanged);
  }

  void _acceptedCreate(AcceptedCreate event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(isAccepted: event.value));
  }

  void _governorateChanged(
      GovernorateChanged event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(
      selectedGovernorate: event.governorate,
      selectedCity: null,
    ));
  }

  void _cityChanged(CityChanged event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(selectedCity: event.city));
  }

  final TapGestureRecognizer login = TapGestureRecognizer();
}
