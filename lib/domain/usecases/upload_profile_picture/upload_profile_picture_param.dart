// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flix_id/domain/entities/user.dart';

class UploadProfilePictureParam {
  final File image;
  final User user;
  UploadProfilePictureParam({
    required this.image,
    required this.user,
  });
}
