import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String id;
  final String name;
  final String email;
  final String? bio;
  final String imgUrl;
  final String allowedCount;
  final String phone;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.imgUrl,
    required this.phone,
    required this.allowedCount,
  });

  static Map<String, dynamic> toFirebase(
    AppUser user,
    SetOptions? options,
  ) {
    return {
      userIdKey: user.id,
      usernameKey: user.name,
      userEmailKey: user.email,
      userBiolKey: user.bio,
      userAllowedCountKey: user.allowedCount,
      userImageUrlKey: user.imgUrl,
      userPhoneNumberKey: user.phone,
    };
  }

  static AppUser fromFirebase(DocumentSnapshot ds, SnapshotOptions? options) {
    return AppUser(
        id: ds.id,
        email: ds.get(userEmailKey),
        bio: ds.get(userBiolKey),
        imgUrl: ds.get(userImageUrlKey),
        name: ds.get(usernameKey),
        phone: ds.get(userPhoneNumberKey),
        allowedCount: ds.get(userAllowedCountKey));
  }

  static const String userIdKey = "id";
  static const String usernameKey = "name";
  static const String userEmailKey = "email";
  static const String userBiolKey = "bio";
  static const String userImageUrlKey = "image_url";
  static const String userPhoneNumberKey = "phone";
  static const String userAllowedCountKey = "allowed_count";
}
