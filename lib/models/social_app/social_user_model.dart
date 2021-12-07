class SocialUserModel {
  late String name;
  late String email;
  late String phone;
  late String image;
  late String cover;
  late String bio;
  late String uId;
  late bool isEmailVerified;

  SocialUserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.cover,
    required this.bio,
    required this.uId,
    required this.isEmailVerified,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'cover': cover,
      'bio': bio,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
