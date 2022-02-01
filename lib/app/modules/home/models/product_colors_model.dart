import 'package:hive/hive.dart';
part 'product_colors_model.g.dart';

@HiveType(typeId: 2)
class ProductColors {

  @HiveField(0)
  String? hexValue;

  @HiveField(1)
  String? colourName;

  ProductColors({this.hexValue, this.colourName});

  ProductColors.fromJson(Map<String, dynamic> json) {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hex_value'] = hexValue;
    data['colour_name'] = colourName;
    return data;
  }
}
