class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic rememberToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? region;
  final String? job;
  final dynamic referralCode;
  final dynamic referralBy;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.dateOfBirth,
    this.region,
    this.job,
    this.referralCode,
    this.referralBy,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        region: json["region"],
        job: json["job"],
        referralCode: json["referral_code"],
        referralBy: json["referral_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "remember_token": rememberToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "gender": gender,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "region": region,
        "job": job,
        "referral_code": referralCode,
        "referral_by": referralBy,
      };
}
