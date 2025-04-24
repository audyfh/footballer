import 'package:footballer/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {

  UserModel({required super.id, required super.username, required super.email, required super.imgUrl});

   Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'imgUrl': imgUrl,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }

}