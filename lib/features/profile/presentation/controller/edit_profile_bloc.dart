import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_data_model.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/edit_profile_use_case.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._useCase) : super(EditProfileInitial()) {
    on<EditProfileProcess>(_editProfileProcess);
    on<InitEditProfile>(_initEditProfile);
    on<GovernorateChanged>(_governorateChanged);
    on<WilayaChanged>(_wilayaChanged);
    on<ChangeImage>(_changeImage);
  }

  final EditProfileUseCase _useCase;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final FormState formState = FormState();
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  void _changeImage(ChangeImage event, Emitter emit) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(state.copyWith());
    }
  }

  void _governorateChanged(GovernorateChanged event, Emitter emit) {
    emit(state.copyWith(selectedGovernorate: event.governorate));
  }

  void _wilayaChanged(WilayaChanged event, Emitter emit) {
    emit(state.copyWith(selectedWilaya: event.wilaya));
  }

  Future<void> _initEditProfile(InitEditProfile event, Emitter emit) async {
    firstName.text = event.profileData.firstName;
    lastName.text = event.profileData.lastName;
    phoneNumber.text = event.profileData.phoneNumber;
    email.text = event.profileData.email;
    emit(
      state.copyWith(
        selectedGovernorate: event.profileData.governorate,
        selectedWilaya: event.profileData.wilaya,
      ),
    );
  }

  Future<void> _editProfileProcess(
      EditProfileProcess event, Emitter emit) async {
    emit(EditProfileLoading());
    (await _useCase.execute(
      EditProfileUseCaseInput(
        id: event.id,
        email: email.text,
        firstName: firstName.text,
        lastName: lastName.text,
        phoneNumber: phoneNumber.text,
        governorate: state.governorate,
        wilaya: state.wilaya,
      ),
    ))
        .fold(
      (l) => emit(EditProfileFailure(message: l.message)),
      (r) => emit(EditProfileSuccessfully()),
    );
  }

  @override
  Future<void> close() {
    disposeEditProfile();
    return super.close();
  }
}
