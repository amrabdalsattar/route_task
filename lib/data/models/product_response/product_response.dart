import 'package:route_task/data/models/product_response/dimensions_data_model.dart';
import 'package:route_task/data/models/product_response/review_data_model.dart';

import 'meta_data_model.dart';

class ProductResponse {
  ProductResponse({
      this.products, 
      this.total, 
      this.skip, 
      this.limit,});

  ProductResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductDM.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<ProductDM>? products;
  int? total;
  int? skip;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}

class ProductDM {
  ProductDM({
      this.id, 
      this.title, 
      this.description, 
      this.category, 
      this.price, 
      this.discountPercentage, 
      this.rating, 
      this.stock, 
      this.tags, 
      this.brand, 
      this.sku, 
      this.weight, 
      this.dimensions, 
      this.warrantyInformation, 
      this.shippingInformation, 
      this.availabilityStatus, 
      this.reviews, 
      this.returnPolicy, 
      this.minimumOrderQuantity, 
      this.meta, 
      this.images, 
      this.thumbnail,});

  ProductDM.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null ? DimensionsDM.fromJson(json['dimensions']) : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(ReviewDM.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? MetaDM.fromJson(json['meta']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'];
  }
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  num? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  DimensionsDM? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewDM>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  MetaDM? meta;
  List<String>? images;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['category'] = category;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['stock'] = stock;
    map['tags'] = tags;
    map['brand'] = brand;
    map['sku'] = sku;
    map['weight'] = weight;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['warrantyInformation'] = warrantyInformation;
    map['shippingInformation'] = shippingInformation;
    map['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['returnPolicy'] = returnPolicy;
    map['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['images'] = images;
    map['thumbnail'] = thumbnail;
    return map;
  }

}



