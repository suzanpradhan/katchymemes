class UserModel {
  String? id;
  String? username;
  String? email;
  String? bio;
  String? name;

  UserModel({
    this.bio,
    this.email,
    this.id,
    this.name,
    this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      bio: json["bio"],
      name: json["name"],
    );
  }
}
