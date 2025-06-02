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
  final String? phoneNumber;
  final String? referralCode;
  final dynamic referredBy;

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
    this.phoneNumber,
    this.referralCode,
    this.referredBy,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"] ?? "Unknown",
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]) ?? DateTime.now(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]) ?? DateTime.now(),
        gender: json["gender"] ?? "Not specified",
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.tryParse(json["date_of_birth"]),
        region: json["region"] ?? "Unknown",
        job: json["job"] ?? "Not specified",
        phoneNumber: json["phone_number"] ?? "No phone number",
        referralCode: json["referral_code"] ?? "No referral",
        referredBy: json["referred_by"] ?? "None",
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) data["id"] = id;
    if (name != null) data["name"] = name;
    if (email != null) data["email"] = email;
    if (emailVerifiedAt != null) data["email_verified_at"] = emailVerifiedAt;
    if (rememberToken != null) data["remember_token"] = rememberToken;
    if (createdAt != null) data["created_at"] = createdAt?.toIso8601String();
    if (updatedAt != null) data["updated_at"] = updatedAt?.toIso8601String();
    if (gender != null) data["gender"] = gender;
    if (dateOfBirth != null) {
      data["date_of_birth"] =
          "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}";
    }
    if (region != null) data["region"] = region;
    if (job != null) data["job"] = job;
    if (phoneNumber != null) data["phone_number"] = phoneNumber;
    if (referralCode != null) data["referral_code"] = referralCode;
    if (referredBy != null) data["referred_by"] = referredBy;

    return data;
  }
}
