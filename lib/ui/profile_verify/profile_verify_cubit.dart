import 'dart:io';

import 'package:chatApp/data/image_picker_repository.dart';
import 'package:chatApp/data/stream_api_repository.dart';
import 'package:chatApp/domain/usecases/profile_sign_in_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState {
  const ProfileState(this.file, {this.success = false});
  final File file;
  final bool success;
}

class ProfileVerifyCubit extends Cubit<ProfileState> {
  ProfileVerifyCubit(this._imagePickerRepository, this._profileSignInUseCase)
      : super(ProfileState(null));

  final nameController = TextEditingController();
  final ImagePickerRepository _imagePickerRepository;
  final ProfileSignInUseCase _profileSignInUseCase;

  void startChatting() async {
    final file = state.file;
    final name = nameController.text;
    await _profileSignInUseCase.verify(ProfileInput(
      imageFile: file,
      name: name,
    ));
    emit(ProfileState(file, success: true));
  }

  void pickImage() async {
    final file = await _imagePickerRepository.pickImage();
    emit(ProfileState(file));
  }
}
