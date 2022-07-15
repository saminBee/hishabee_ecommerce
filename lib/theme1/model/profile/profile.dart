// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.id,
    this.userType,
    this.name,
    this.brandName,
    this.email,
    this.emailVerifiedAt,
    this.verifiedAt,
    this.ownerName,
    this.mobileNumber,
    this.website,
    this.logoUrl,
    this.avatar,
    this.avatarOriginal,
    this.address,
    this.postalCode,
    this.balance,
    this.referralCode,
    this.customerPackageId,
    this.remainingUploads,
    this.interest,
    this.verificationCode,
    this.createdAt,
    this.updatedAt,
    this.nidVerified,
    this.nidNumber,
  });

  int? id;
  String? userType;
  String? name;
  dynamic brandName;
  dynamic email;
  DateTime? emailVerifiedAt;
  DateTime? verifiedAt;
  dynamic ownerName;
  String? mobileNumber;
  dynamic website;
  dynamic logoUrl;
  dynamic avatar;
  dynamic avatarOriginal;
  dynamic address;
  dynamic postalCode;
  int? balance;
  dynamic referralCode;
  dynamic customerPackageId;
  int? remainingUploads;
  dynamic interest;
  dynamic verificationCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? nidVerified;
  dynamic nidNumber;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    userType: json["user_type"],
    name: json["name"],
    brandName: json["brand_name"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    verifiedAt: DateTime.parse(json["verified_at"]),
    ownerName: json["owner_name"],
    mobileNumber: json["mobile_number"],
    website: json["website"],
    logoUrl: json["logo_url"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    address: json["address"],
    postalCode: json["postal_code"],
    balance: json["balance"],
    referralCode: json["referral_code"],
    customerPackageId: json["customer_package_id"],
    remainingUploads: json["remaining_uploads"],
    interest: json["interest"],
    verificationCode: json["verification_code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    nidVerified: json["nid_verified"],
    nidNumber: json["nid_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_type": userType,
    "name": name,
    "brand_name": brandName,
    "email": email,
    "email_verified_at": emailVerifiedAt!.toIso8601String(),
    "verified_at": verifiedAt!.toIso8601String(),
    "owner_name": ownerName,
    "mobile_number": mobileNumber,
    "website": website,
    "logo_url": logoUrl,
    "avatar": avatar,
    "avatar_original": avatarOriginal,
    "address": address,
    "postal_code": postalCode,
    "balance": balance,
    "referral_code": referralCode,
    "customer_package_id": customerPackageId,
    "remaining_uploads": remainingUploads,
    "interest": interest,
    "verification_code": verificationCode,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "nid_verified": nidVerified,
    "nid_number": nidNumber,
  };
}
