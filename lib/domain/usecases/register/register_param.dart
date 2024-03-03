// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterParam {
  final String email;
  final String name;
  final String password;
  final String? photoUrl;
  RegisterParam({
    required this.email,
    required this.name,
    required this.password,
    this.photoUrl,
  });
}
