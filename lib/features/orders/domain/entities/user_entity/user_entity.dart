class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String userImage;

  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    required this.userImage,
  });

  UserEntity toEntity() {
    return UserEntity(name: name, email: email, uId: uId, userImage: userImage);
  }
}
