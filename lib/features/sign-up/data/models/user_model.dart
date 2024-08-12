import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(userId: json['data']['user_id']);
  }
}
