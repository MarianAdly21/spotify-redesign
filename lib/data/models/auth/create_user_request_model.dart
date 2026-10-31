class CreateUserRequestModel {
  final String fullName;
  final String email;
  final String password;

  CreateUserRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
