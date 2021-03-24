import 'package:chatApp/data/auth_repository.dart';
import 'package:chatApp/data/image_picker_repository.dart';
import 'package:chatApp/data/local/auth_local_impl.dart';
import 'package:chatApp/data/local/image_picker_impl.dart';
import 'package:chatApp/data/local/persistent_storage_local_impl.dart';
import 'package:chatApp/data/local/stream_api_local_impl.dart';
import 'package:chatApp/data/local/upload_storage_local_impl.dart';
import 'package:chatApp/data/persistent_storage_repository.dart';
import 'package:chatApp/data/stream_api_repository.dart';
import 'package:chatApp/data/upload_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'domain/usecases/create_group_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/logout_usecase.dart';
import 'domain/usecases/profile_sign_in_usecase.dart';

List<RepositoryProvider> buildRepositories(StreamChatClient client) {
  return [
    RepositoryProvider<StreamApiRepository>(
        create: (_) => StreamApiLocalImpl(client)),
    RepositoryProvider<PersistentStorageRepository>(
        create: (_) => PersistentStorageLocalImpl()),
    RepositoryProvider<AuthRepository>(create: (_) => AuthLocalImpl()),
    RepositoryProvider<UploadStorageRepository>(
        create: (_) => UploadStorageLocalImpl()),
    RepositoryProvider<ImagePickerRepository>(create: (_) => ImagePickerImpl()),
    RepositoryProvider<ProfileSignInUseCase>(
      create: (context) => ProfileSignInUseCase(
        context.read(),
        context.read(),
        context.read(),
      ),
    ),
    RepositoryProvider<CreateGroupUseCase>(
      create: (context) => CreateGroupUseCase(
        context.read(),
        context.read(),
      ),
    ),
    RepositoryProvider<LogoutUseCase>(
      create: (context) => LogoutUseCase(
        context.read(),
        context.read(),
      ),
    ),
    RepositoryProvider<LoginUseCase>(
      create: (context) => LoginUseCase(
        context.read(),
        context.read(),
      ),
    ),
  ];
}
