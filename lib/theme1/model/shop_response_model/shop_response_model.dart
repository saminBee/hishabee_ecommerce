// To parse this JSON data, do
//
//     final shopResponseModel = shopResponseModelFromJson(jsonString);

import 'dart:convert';

ShopResponseModel shopResponseModelFromJson(String str) => ShopResponseModel.fromJson(json.decode(str));

String shopResponseModelToJson(ShopResponseModel data) => json.encode(data.toJson());

class ShopResponseModel {
  ShopResponseModel({
    this.code,
    this.message,
    this.shop,
  });

  int? code;
  String? message;
  Shop? shop;

  factory ShopResponseModel.fromJson(Map<String, dynamic> json) => ShopResponseModel(
    code: json["code"],
    message: json["message"],
    shop: Shop.fromJson(json["shop"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "shop": shop!.toJson(),
  };
}

class Shop {
  Shop({
    this.id,
    this.userId,
    this.name,
    this.slug,
    this.type,
    this.area,
    this.address,
    this.sliders,
    this.lat,
    this.lng,
    this.shopNumber,
    this.floorNumber,
    this.vatPercent,
    this.publicNumber,
    this.logoUrl,
    this.referralCode,
    this.facebook,
    this.instagram,
    this.twitter,
    this.youtube,
    this.setDefault,
    this.createdAt,
    this.updatedAt,
    this.metaTitle,
    this.metaDescription,
    this.pickUpPointId,
    this.tradeLicense,
    this.tin,
    this.public,
    this.active,
    this.onlineShopCreatedAt,
    this.campaignId,
    this.smsCount,
    this.theme,
    this.lastActive,
    this.salesFunnel,
    this.balance,
    this.addedToWhatsapp,
    this.isAgent,
    this.agentApplicationStatus,
    this.time,
    this.package,
    this.endDate,
    this.walletBalance,
    this.liquidBalance,
    this.deviceCount,
    this.hishabeeCredit,
    this.nidVerified,
    this.campaign,
    this.wallet,
    this.user,
  });

  int? id;
  int? userId;
  String? name;
  String? slug;
  int? type;
  int? area;
  String? address;
  String? sliders;
  int? lat;
  int? lng;
  int? shopNumber;
  int? floorNumber;
  int? vatPercent;
  String? publicNumber;
  String? logoUrl;
  String? referralCode;
  String? facebook;
  String? instagram;
  dynamic twitter;
  String? youtube;
  int? setDefault;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic pickUpPointId;
  dynamic tradeLicense;
  dynamic tin;
  bool? public;
  int? active;
  DateTime? onlineShopCreatedAt;
  dynamic campaignId;
  int? smsCount;
  int? theme;
  DateTime? lastActive;
  dynamic salesFunnel;
  int? balance;
  int? addedToWhatsapp;
  int? isAgent;
  String? agentApplicationStatus;
  DateTime? time;
  String? package;
  DateTime? endDate;
  double? walletBalance;
  double? liquidBalance;
  int? deviceCount;
  double? hishabeeCredit;
  bool? nidVerified;
  dynamic campaign;
  Wallet? wallet;
  User? user;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    slug: json["slug"],
    type: json["type"],
    area: json["area"],
    address: json["address"],
    sliders: json["sliders"],
    lat: json["lat"],
    lng: json["lng"],
    shopNumber: json["shop_number"],
    floorNumber: json["floor_number"],
    vatPercent: json["vat_percent"],
    publicNumber: json["public_number"],
    logoUrl: json["logo_url"],
    referralCode: json["referral_code"],
    facebook: json["facebook"],
    instagram: json["instagram"],
    twitter: json["twitter"],
    youtube: json["youtube"],
    setDefault: json["set_default"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    pickUpPointId: json["pick_up_point_id"],
    tradeLicense: json["trade_license"],
    tin: json["tin"],
    public: json["public"],
    active: json["active"],
    onlineShopCreatedAt: DateTime.parse(json["online_shop_created_at"]),
    campaignId: json["campaign_id"],
    smsCount: json["sms_count"],
    theme: json["theme"],
    lastActive: DateTime.parse(json["last_active"]),
    salesFunnel: json["sales_funnel"],
    balance: json["balance"],
    addedToWhatsapp: json["added_to_whatsapp"],
    isAgent: json["is_agent"],
    agentApplicationStatus: json["agent_application_status"],
    time: DateTime.parse(json["time"]),
    package: json["package"],
    endDate: DateTime.parse(json["end_date"]),
    walletBalance: json["wallet_balance"].toDouble(),
    liquidBalance: json["liquid_balance"].toDouble(),
    deviceCount: json["device_count"],
    hishabeeCredit: json["hishabee_credit"].toDouble(),
    nidVerified: json["nid_verified"],
    campaign: json["campaign"],
    wallet: Wallet.fromJson(json["wallet"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "slug": slug,
    "type": type,
    "area": area,
    "address": address,
    "sliders": sliders,
    "lat": lat,
    "lng": lng,
    "shop_number": shopNumber,
    "floor_number": floorNumber,
    "vat_percent": vatPercent,
    "public_number": publicNumber,
    "logo_url": logoUrl,
    "referral_code": referralCode,
    "facebook": facebook,
    "instagram": instagram,
    "twitter": twitter,
    "youtube": youtube,
    "set_default": setDefault,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "pick_up_point_id": pickUpPointId,
    "trade_license": tradeLicense,
    "tin": tin,
    "public": public,
    "active": active,
    "online_shop_created_at": onlineShopCreatedAt!.toIso8601String(),
    "campaign_id": campaignId,
    "sms_count": smsCount,
    "theme": theme,
    "last_active": lastActive!.toIso8601String(),
    "sales_funnel": salesFunnel,
    "balance": balance,
    "added_to_whatsapp": addedToWhatsapp,
    "is_agent": isAgent,
    "agent_application_status": agentApplicationStatus,
    "time": time!.toIso8601String(),
    "package": package,
    "end_date": endDate!.toIso8601String(),
    "wallet_balance": walletBalance,
    "liquid_balance": liquidBalance,
    "device_count": deviceCount,
    "hishabee_credit": hishabeeCredit,
    "nid_verified": nidVerified,
    "campaign": campaign,
    "wallet": wallet!.toJson(),
    "user": user!.toJson(),
  };
}

class User {
  User({
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
  String? brandName;
  dynamic email;
  dynamic emailVerifiedAt;
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
  String? nidNumber;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userType: json["user_type"],
    name: json["name"],
    brandName: json["brand_name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
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
    "email_verified_at": emailVerifiedAt,
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

class Wallet {
  Wallet({
    this.id,
    this.userId,
    this.shopId,
    this.totalBalance,
    this.liquidBalance,
    this.hishabeeGrant,
    this.giftPoints,
    this.walletBarcode,
    this.createdAt,
    this.updatedAt,
    this.hishabeeCredit,
  });

  int? id;
  int? userId;
  int? shopId;
  double? totalBalance;
  double? liquidBalance;
  int? hishabeeGrant;
  int? giftPoints;
  dynamic walletBarcode;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? hishabeeCredit;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    userId: json["user_id"],
    shopId: json["shop_id"],
    totalBalance: json["total_balance"].toDouble(),
    liquidBalance: json["liquid_balance"].toDouble(),
    hishabeeGrant: json["hishabee_grant"],
    giftPoints: json["gift_points"],
    walletBarcode: json["wallet_barcode"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    hishabeeCredit: json["hishabee_credit"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "shop_id": shopId,
    "total_balance": totalBalance,
    "liquid_balance": liquidBalance,
    "hishabee_grant": hishabeeGrant,
    "gift_points": giftPoints,
    "wallet_barcode": walletBarcode,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "hishabee_credit": hishabeeCredit,
  };
}
