
import 'profile_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/profile_repo.dart';
import '../../data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitialState());
  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileModel profile = ProfileModel.empty();

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold(
      (failure) => emit(GetProfileFailure(message: failure.message)),
      (profile) {
        if (profile == null) {
          emit(GetProfileFailure(message: 'Profile not found'));
          return;
        }
        this.profile = profile;
        emit(GetProfileSuccess());
      },
    );
  }

  Future<void> saveProfile(ProfileModel profile) async {
    emit(SaveProfileLoading());
    final result = await profileRepo.saveProfile(profile);
    result.fold(
      (failure) => emit(SaveProfileFailure(message: failure.message)),
      (_) {
        this.profile = profile;
        emit(SaveProfileSuccess());
      },
    );
  }

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoading());
    final result = await profileRepo.deleteProfile();
    result.fold(
      (failure) => emit(DeleteProfileFailure(message: failure.message)),
      (_) {
        profile = ProfileModel.empty();
        emit(DeleteProfileSuccess());
      },
    );
  }
}
