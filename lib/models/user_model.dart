class UserModel {
  String? id;
  String? username;
  String? email;
  String? bio;
  String? name;
  String? imageUrl;

  UserModel({
    this.bio,
    this.email,
    this.id,
    this.name,
    this.username,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        username: json["user_username"],
        email: json["email"],
        bio: json["bio"],
        name: json["name"],
        imageUrl: json["user_avatar_filename"]);
  }
}
