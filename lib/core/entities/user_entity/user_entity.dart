class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String userImage;
  String? role;

  UserEntity({
    this.role,
    required this.name,
    required this.email,
    required this.uId,
    required this.userImage,
  });

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      uId: uId,
      userImage: userImage,
      role: role,
    );
  }
}
