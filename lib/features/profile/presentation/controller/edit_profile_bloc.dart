import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/features/profile/domain/model/profile_data_model.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:wafir_mobile/features/profile/domain/use_case/get_profile_use_case.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._useCase, this._getProfileUseCase)
      : super(const EditProfileState()) {
    on<EditProfileProcess>(_editProfileProcess);
    on<LoadEditProfileData>(_loadEditProfileData);
    on<GovernorateChanged>(_governorateChanged);
    on<WilayaChanged>(_wilayaChanged);
    on<ChangeImage>(_changeImage);
  }
  final GetProfileUseCase _getProfileUseCase;
  final EditProfileUseCase _useCase;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final FormState formState = FormState();
  File? selectedImage;
  ProfileDataModel? _originalProfile;
  final ImagePicker _picker = ImagePicker();

  String get avatarUrl => _originalProfile?.avatarUrl ?? '';

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
    emit(state.copyWith(
      selectedGovernorate: event.governorate,
      selectedWilaya: null,
    ));
  }

  void _wilayaChanged(WilayaChanged event, Emitter emit) {
    emit(state.copyWith(selectedWilaya: event.wilaya));
  }

  Future<void> _loadEditProfileData(
      LoadEditProfileData event, Emitter<EditProfileState> emit) async {
    emit(
      state.copyWith(
        status: EditProfileStatus.loadingProfile,
        message: null,
      ),
    );
    (await _getProfileUseCase.execute()).fold(
      (l) => emit(
        state.copyWith(
          status: EditProfileStatus.failure,
          message: l.message,
          isProfileLoaded: false,
        ),
      ),
      (r) {
        _originalProfile = r.user;
        firstName.text = r.user.firstName;
        lastName.text = r.user.lastName;
        phoneNumber.text = r.user.phoneNumber;
        email.text = r.user.email;
        selectedImage = null;
        emit(
          state.copyWith(
            status: EditProfileStatus.ready,
            selectedGovernorate: r.user.governorate,
            selectedWilaya: r.user.wilaya,
            message: null,
            isProfileLoaded: true,
          ),
        );
      },
    );
  }

  Future<void> _editProfileProcess(
      EditProfileProcess event, Emitter<EditProfileState> emit) async {
    if (!state.isProfileLoaded || _originalProfile == null) {
      return;
    }

    final changedFirstName =
        _resolveChangedValue(firstName.text, _originalProfile!.firstName);
    final changedLastName =
        _resolveChangedValue(lastName.text, _originalProfile!.lastName);
    final changedPhoneNumber =
        _resolveChangedValue(phoneNumber.text, _originalProfile!.phoneNumber);
    final changedGovernorate =
        _resolveChangedValue(state.governorate, _originalProfile!.governorate);
    final changedWilaya =
        _resolveChangedValue(state.wilaya, _originalProfile!.wilaya);

    final hasDataChanges = changedFirstName != null ||
        changedLastName != null ||
        changedPhoneNumber != null ||
        changedGovernorate != null ||
        changedWilaya != null;

    final hasImageChange = selectedImage != null;

    if (!hasDataChanges && !hasImageChange) {
      emit(
        state.copyWith(
          status: EditProfileStatus.success,
          message: 'لا يوجد تعديلات للحفظ',
          isProfileLoaded: true,
        ),
      );
      emit(
        state.copyWith(
          status: EditProfileStatus.ready,
          message: null,
          isProfileLoaded: true,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: EditProfileStatus.submitting,
        message: null,
        isProfileLoaded: true,
      ),
    );

    (await _useCase.execute(
      EditProfileUseCaseInput(
        image: hasImageChange ? selectedImage : null,
        firstName: changedFirstName,
        lastName: changedLastName,
        phoneNumber: changedPhoneNumber,
        governorate: changedGovernorate,
        wilaya: changedWilaya,
      ),
    ))
        .fold(
      (l) => emit(
        state.copyWith(
          status: EditProfileStatus.failure,
          message: l.message,
          isProfileLoaded: true,
        ),
      ),
      (r) {
        _originalProfile = r.user;
        firstName.text = r.user.firstName;
        lastName.text = r.user.lastName;
        phoneNumber.text = r.user.phoneNumber;
        email.text = r.user.email;
        selectedImage = null;
        emit(
          state.copyWith(
            status: EditProfileStatus.success,
            selectedGovernorate: r.user.governorate,
            selectedWilaya: r.user.wilaya,
            message: r.message,
            isProfileLoaded: true,
          ),
        );
        emit(
          state.copyWith(
            status: EditProfileStatus.ready,
            message: null,
            isProfileLoaded: true,
          ),
        );
      },
    );
  }

  String? _resolveChangedValue(String? currentValue, String originalValue) {
    final trimmed = currentValue?.trim();
    if (trimmed == null || trimmed.isEmpty || trimmed == originalValue) {
      return null;
    }
    return trimmed;
  }

  @override
  Future<void> close() {
    disposeEditProfile();
    return super.close();
  }
}
