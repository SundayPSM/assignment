import 'package:hive/hive.dart';
import 'package:morphos_assignment/app/modules/home/models/product_colors_model.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class Product {

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? brand;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? price;

  @HiveField(4)
  String? priceSign;

  @HiveField(5)
  String? currency;

  @HiveField(6)
  String? imageLink;

  @HiveField(7)
  String? productLink;

  @HiveField(8)
  String? websiteLink;

  @HiveField(9)
  String? description;

  @HiveField(10)
  dynamic rating;

  @HiveField(11)
  String? category;

  @HiveField(12)
  String? productType;

  @HiveField(13)
  List<String>? tagList;

  @HiveField(14)
  String? createdAt;

  @HiveField(15)
  String? updatedAt;

  @HiveField(16)
  String? productApiUrl;

  @HiveField(17)
  String? apiFeaturedImage;

  @HiveField(18)
  List<ProductColors>? productColors;

  Product(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.priceSign,
      this.currency,
      this.imageLink,
      this.productLink,
      this.websiteLink,
      this.description,
      this.rating,
      this.category,
      this.productType,
      this.tagList,
      this.createdAt,
      this.updatedAt,
      this.productApiUrl,
      this.apiFeaturedImage,
      this.productColors});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    priceSign = json['price_sign'];
    currency = json['currency'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    category = json['category'];
    productType = json['product_type'];
    tagList = json['tag_list'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
    if (json['product_colors'] != null) {
      productColors = <ProductColors>[];
      json['product_colors'].forEach((v) {
        productColors?.add(ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
    data['name'] = name;
    data['price'] = price;
    data['price_sign'] = priceSign;
    data['currency'] = currency;
    data['image_link'] = imageLink;
    data['product_link'] = productLink;
    data['website_link'] = websiteLink;
    data['description'] = description;
    data['rating'] = rating;
    data['category'] = category;
    data['product_type'] = productType;
    data['tag_list'] = tagList;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['product_api_url'] = productApiUrl;
    data['api_featured_image'] = apiFeaturedImage;
    if (productColors != null) {
      data['product_colors'] = productColors?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

