import 'dart:io';

import 'package:chatApp/data/upload_storage_repository.dart';

class UploadStorageLocalImpl extends UploadStorageRepository {
  @override
  Future<String> uploadPhoto(File file, String path) async {
    return 'https://lh3.googleusercontent.com/a-/AOh14GhZTLef-EzCc3A__jgji7LakC3gNEzsm-x0aVH_iQ=s96-c-rg-br100';
  }
}
