import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  LogInModel({
    this.refreshToken,
    this.accessToken,
    this.message,
    this.user,
  });

  String? refreshToken;
  String? accessToken;
  String? message;
  User? user;

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
        "accessToken": accessToken,
        "message": message,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.fName,
    this.sName,
    this.phone,
    this.email,
    this.password,
    this.roleId,
    this.statusDate,
    this.status,
    this.refreshToken,
    this.refershTokenExpiration,
    this.inserted,
    this.updated,
    this.mRole,
  });

  int? id;
  String? fName;
  String? sName;
  String? phone;
  String? email;
  String? password;
  int? roleId;
  DateTime? statusDate;
  int? status;
  String? refreshToken;
  DateTime? refershTokenExpiration;
  DateTime? inserted;
  DateTime? updated;
  MRole? mRole;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fName: json["fName"],
        sName: json["sName"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        roleId: json["roleId"],
        statusDate: DateTime.parse(json["statusDate"]),
        status: json["status"],
        refreshToken: json["refreshToken"],
        refershTokenExpiration: DateTime.parse(json["refershTokenExpiration"]),
        inserted: DateTime.parse(json["inserted"]),
        updated: DateTime.parse(json["updated"]),
        mRole: MRole.fromJson(json["mRole"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fName": fName,
        "sName": sName,
        "phone": phone,
        "email": email,
        "password": password,
        "roleId": roleId,
        "statusDate": statusDate!.toIso8601String(),
        "status": status,
        "refreshToken": refreshToken,
        "refershTokenExpiration": refershTokenExpiration!.toIso8601String(),
        "inserted": inserted!.toIso8601String(),
        "updated": updated!.toIso8601String(),
        "mRole": mRole!.toJson(),
      };
}

class MRole {
  MRole({
    this.id,
    this.parentId,
    this.resourceName,
    this.status,
    this.inserted,
    this.updated,
    this.mUser,
  });

  int? id;
  int? parentId;
  String? resourceName;
  bool? status;
  DateTime? inserted;
  DateTime? updated;
  List<dynamic>? mUser;

  factory MRole.fromJson(Map<String, dynamic> json) => MRole(
        id: json["id"],
        parentId: json["parentId"],
        resourceName: json["resourceName"],
        status: json["status"],
        inserted: DateTime.parse(json["inserted"]),
        updated: DateTime.parse(json["updated"]),
        mUser: List<dynamic>.from(json["mUser"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentId": parentId,
        "resourceName": resourceName,
        "status": status,
        "inserted": inserted!.toIso8601String(),
        "updated": updated!.toIso8601String(),
        "mUser": List<dynamic>.from(mUser!.map((x) => x)),
      };
}
