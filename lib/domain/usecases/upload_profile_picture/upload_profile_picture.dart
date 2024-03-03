// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/user.dart';
import 'package:flix_id/domain/usecases/upload_profile_picture/upload_profile_picture_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;
  UploadProfilePicture({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;
  @override
  Future<Result<User>> call(UploadProfilePictureParam params) {
    return _userRepository.uploadProfilePicture(
        user: params.user, imageFile: params.image);
  }
}
