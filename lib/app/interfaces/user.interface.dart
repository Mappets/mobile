import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.organizations,
    this.isStaff,
    this.isSuperuser,
    this.isActive,
    this.dateJoined,
    this.fullName,
    this.profile,
    this.firstName,
    this.lastName,
  });

  String id;
  String name;
  String email;
  String phone;
  List<dynamic> organizations;
  bool isStaff;
  bool isSuperuser;
  bool isActive;
  DateTime dateJoined;
  String fullName;
  Profile profile;
  String firstName;
  String lastName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        organizations: List<dynamic>.from(json["organizations"].map((x) => x)),
        isStaff: json["is_staff"],
        isSuperuser: json["is_superuser"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        fullName: json["full_name"],
        profile: Profile.fromJson(json["profile"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "organizations": List<dynamic>.from(organizations.map((x) => x)),
        "is_staff": isStaff,
        "is_superuser": isSuperuser,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "full_name": fullName,
        "profile": profile.toJson(),
        "first_name": firstName,
        "last_name": lastName,
      };
}

class Profile {
  Profile({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deleted,
    this.name,
    this.picture,
    this.phone,
    this.user,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  bool deleted;
  String name;
  dynamic picture;
  String phone;
  String user;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        deleted: json["deleted"],
        name: json["name"],
        picture: json["picture"],
        phone: json["phone"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "deleted": deleted,
        "name": name,
        "picture": picture,
        "phone": phone,
        "user": user,
      };
}
