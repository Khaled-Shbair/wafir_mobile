import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_email_use_case.dart';
import 'package:wafir_mobile/features/auth/domain/use_case/register_by_google_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._registerByGoogleUseCase, this._registerByEmailUseCase)
      : super(const RegisterInitial()) {
    on<AcceptedCreate>(_acceptedCreate);
    on<GovernorateChanged>(_governorateChanged);
    on<CityChanged>(_cityChanged);
    on<RegisterByEmailProcess>(_registerByEmailProcess);
    on<RegisterByGoogleProcess>(_registerByGoogleProcess);
  }

  final RegisterByEmailUseCase _registerByEmailUseCase;
  final RegisterByGoogleUseCase _registerByGoogleUseCase;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TapGestureRecognizer login = TapGestureRecognizer();

  final formKey = GlobalKey<FormState>();

  void _registerByEmailProcess(
      RegisterByEmailProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      if (state.isAccepted) {
        emit(
          RegisterLoading(
            isAccepted: state.isAccepted,
            selectedGovernorate: state.selectedGovernorate,
            selectedCity: state.selectedCity,
          ),
        );
        (await _registerByEmailUseCase.execute(
          RegisterByEmailUseCaseInput(
            email: email.text,
            password: password.text,
            firstName: firstName.text,
            lastName: lastName.text,
            phoneNumber: '+968${phoneNumber.text}',
            governorate: state.selectedGovernorate ?? '',
            city: state.selectedCity ?? '',
          ),
        )
          ..fold(
            (f) {
              emit(
                RegisterFailure(
                  errorMessage: f.message,
                  isAccepted: state.isAccepted,
                  selectedGovernorate: state.selectedGovernorate,
                  selectedCity: state.selectedCity,
                ),
              );
            },
            (r) {
              emit(
                RegisterSuccessfully(
                  isAccepted: state.isAccepted,
                  selectedGovernorate: state.selectedGovernorate,
                  selectedCity: state.selectedCity,
                ),
              );
            },
          ));
      } else {
        emit(
          RegisterFailure(
            errorMessage: ManagerStrings.pleaseAcceptTermsAndConditions,
            isAccepted: state.isAccepted,
            selectedGovernorate: state.selectedGovernorate,
            selectedCity: state.selectedCity,
          ),
        );
      }
    }
  }

  void _registerByGoogleProcess(
      RegisterByGoogleProcess event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      (await _registerByGoogleUseCase.execute()
        ..fold(
          (f) {
            emit(RegisterFailure(
              errorMessage: f.message,
              isAccepted: state.isAccepted,
              selectedGovernorate: state.selectedGovernorate,
              selectedCity: state.selectedCity,
            ));
          },
          (r) {
            emit(
              RegisterSuccessfully(
                isAccepted: state.isAccepted,
                selectedGovernorate: state.selectedGovernorate,
                selectedCity: state.selectedCity,
              ),
            );
          },
        ));
    }
  }

  void _acceptedCreate(AcceptedCreate event, Emitter emit) {
    emit(state.copyWith(isAccepted: event.value));
  }

  void _governorateChanged(GovernorateChanged event, Emitter emit) {
    emit(state.copyWith(selectedGovernorate: event.governorate));
  }

  void _cityChanged(CityChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(selectedCity: event.city));
  }

  @override
  Future<void> close() {
    disposeRegister();

    email.dispose();
    password.dispose();
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    login.dispose();

    return super.close();
  }
}
