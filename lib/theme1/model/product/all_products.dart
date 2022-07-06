// To parse this JSON data, do
//
//     final getAllProducts = getAllProductsFromJson(jsonString);

import 'dart:convert';

List<GetAllProducts> getOnlineProductListModelFromJson(dynamic str) =>
    List<GetAllProducts>.from(str.map((x) =>
        GetAllProducts.fromJson(x)));

GetAllProducts getAllProductsFromJson(String str) => GetAllProducts.fromJson(json.decode(str));

String getAllProductsToJson(GetAllProducts data) => json.encode(data.toJson());

class GetAllProducts {
  GetAllProducts({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  factory GetAllProducts.fromJson(Map<String, dynamic> json) => GetAllProducts(
    currentPage: json["current_page"],
    data: json["data"] == null ? null: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.subUnit,
    this.unit,
    this.shopId,
    this.productId,
    this.name,
    this.subCategory,
    this.sellingPrice,
    this.costPrice,
    this.wholesalePrice,
    this.wholesaleAmount,
    this.gallery,
    this.warrantyType,
    this.warranty,
    this.stock,
    this.description,
    this.vatApplicable,
    this.barcode,
    this.imageUrl,
    this.productType,
    this.approved,
    this.stockAlert,
    this.createdAt,
    this.updatedAt,
    this.vatPercent,
    this.addedBy,
    this.brandId,
    this.thumbnailImg,
    this.featuredImg,
    this.flashDealImg,
    this.videoProvider,
    this.videoLink,
    this.tags,
    this.choiceOptions,
    this.colors,
    this.todaysDeal,
    this.published,
    this.featured,
    this.discount,
    this.discountType,
    this.shippingType,
    this.shippingCost,
    this.numOfSale,
    this.metaTitle,
    this.metaDescription,
    this.metaImg,
    this.pdf,
    this.slug,
    this.rating,
    this.digital,
    this.fileName,
    this.filePath,
    this.locationId,
    this.pickupInstruction,
    this.version,
    this.uniqueId,
  });

  int? id;
  int? userId;
  String? subUnit;
  int? unit;
  int? shopId;
  int? productId;
  String? name;
  int? subCategory;
  int? sellingPrice;
  int? costPrice;
  int? wholesalePrice;
  int? wholesaleAmount;
  String? gallery;
  String? warrantyType;
  int? warranty;
  int? stock;
  String? description;
  bool? vatApplicable;
  dynamic barcode;
  String? imageUrl;
  ProductType? productType;
  DateTime? approved;
  dynamic stockAlert;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vatPercent;
  int? addedBy;
  dynamic brandId;
  dynamic thumbnailImg;
  dynamic featuredImg;
  dynamic flashDealImg;
  dynamic videoProvider;
  dynamic videoLink;
  dynamic tags;
  dynamic choiceOptions;
  dynamic colors;
  int? todaysDeal;
  bool? published;
  int? featured;
  int? discount;
  String? discountType;
  ShippingType? shippingType;
  int? shippingCost;
  int? numOfSale;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImg;
  dynamic pdf;
  String? slug;
  int? rating;
  int? digital;
  dynamic fileName;
  dynamic filePath;
  LocationId? locationId;
  dynamic pickupInstruction;
  int? version;
  String? uniqueId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    subUnit: json["sub_unit"],
    unit: json["unit"],
    shopId: json["shop_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    name: json["name"],
    subCategory: json["sub_category"],
    sellingPrice: json["selling_price"],
    costPrice: json["cost_price"],
    wholesalePrice: json["wholesale_price"],
    wholesaleAmount: json["wholesale_amount"],
    gallery: json["gallery"],
    warrantyType: json["warranty_type"],
    warranty: json["warranty"],
    stock: json["stock"],
    description: json["description"] == null ? null : json["description"],
    vatApplicable: json["vat_applicable"],
    barcode: json["barcode"],
    imageUrl: json["image_url"] == null ? null : json["image_url"],
    productType: productTypeValues.map[json["product_type"]],
    approved: json["approved"] == null ? null : DateTime.parse(json["approved"]),
    stockAlert: json["stock_alert"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    vatPercent: json["vat_percent"],
    addedBy: json["added_by"],
    brandId: json["brand_id"],
    thumbnailImg: json["thumbnail_img"],
    featuredImg: json["featured_img"],
    flashDealImg: json["flash_deal_img"],
    videoProvider: json["video_provider"],
    videoLink: json["video_link"],
    tags: json["tags"],
    choiceOptions: json["choice_options"],
    colors: json["colors"],
    todaysDeal: json["todays_deal"],
    published: json["published"],
    featured: json["featured"],
    discount: json["discount"] == null ? null : json["discount"],
    discountType: json["discount_type"] == null ? null : json["discount_type"],
    shippingType: shippingTypeValues.map[json["shipping_type"]],
    shippingCost: json["shipping_cost"],
    numOfSale: json["num_of_sale"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaImg: json["meta_img"],
    pdf: json["pdf"],
    slug: json["slug"],
    rating: json["rating"],
    digital: json["digital"],
    fileName: json["file_name"],
    filePath: json["file_path"],
    locationId: locationIdValues.map[json["location_id"]],
    pickupInstruction: json["pickup_instruction"],
    version: json["version"],
    uniqueId: json["unique_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "sub_unit": subUnit,
    "unit": unit,
    "shop_id": shopId,
    "product_id": productId == null ? null : productId,
    "name": name,
    "sub_category": subCategory,
    "selling_price": sellingPrice,
    "cost_price": costPrice,
    "wholesale_price": wholesalePrice,
    "wholesale_amount": wholesaleAmount,
    "gallery": gallery,
    "warranty_type": warrantyType,
    "warranty": warranty,
    "stock": stock,
    "description": description == null ? null : description,
    "vat_applicable": vatApplicable,
    "barcode": barcode,
    "image_url": imageUrl == null ? null : imageUrl,
    "product_type": productTypeValues.reverse[productType],
    "approved": approved == null ? null : approved!.toIso8601String(),
    "stock_alert": stockAlert,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "vat_percent": vatPercent,
    "added_by": addedBy,
    "brand_id": brandId,
    "thumbnail_img": thumbnailImg,
    "featured_img": featuredImg,
    "flash_deal_img": flashDealImg,
    "video_provider": videoProvider,
    "video_link": videoLink,
    "tags": tags,
    "choice_options": choiceOptions,
    "colors": colors,
    "todays_deal": todaysDeal,
    "published": published,
    "featured": featured,
    "discount": discount == null ? null : discount,
    "discount_type": discountType == null ? null : discountType,
    "shipping_type": shippingTypeValues.reverse[shippingType],
    "shipping_cost": shippingCost,
    "num_of_sale": numOfSale,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_img": metaImg,
    "pdf": pdf,
    "slug": slug,
    "rating": rating,
    "digital": digital,
    "file_name": fileName,
    "file_path": filePath,
    "location_id": locationIdValues.reverse[locationId],
    "pickup_instruction": pickupInstruction,
    "version": version,
    "unique_id": uniqueId,
  };
}

enum LocationId { EMPTY }

final locationIdValues = EnumValues({
  "[]": LocationId.EMPTY
});

enum ProductType { SIMPLE, PRODUCT_TYPE_SIMPLE, VARIABLE }

final productTypeValues = EnumValues({
  "'Simple'": ProductType.PRODUCT_TYPE_SIMPLE,
  "SIMPLE": ProductType.SIMPLE,
  "VARIABLE": ProductType.VARIABLE
});

enum ShippingType { FLAT_RATE }

final shippingTypeValues = EnumValues({
  "flat_rate": ShippingType.FLAT_RATE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) =>  MapEntry(v, k));
    return reverseMap!;
  }
}
