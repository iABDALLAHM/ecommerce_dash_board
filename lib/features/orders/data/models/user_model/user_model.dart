import 'package:ecommerce_dash_board/features/orders/domain/entities/user_entity/user_entity.dart';

class UserModel {
  final String name;
  final String email;
  final String uId;
  final String userImage;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.userImage,
  });

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      uId: userEntity.uId,
      userImage: userEntity.userImage,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      uId: json["uId"],
      userImage: json["userImage"],
    );
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "email": email, "uId": uId, "userImage": userImage};
  }

  UserEntity toEntity() {
    return UserEntity(name: name, email: email, uId: uId, userImage: userImage);
  }
}
