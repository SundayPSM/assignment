import 'package:morphos_assignment/app/modules/home/models/product_model.dart';
import 'package:hive/hive.dart';
class Boxes{
  
  static Box<Product> getProducts()=>Hive.box<Product>('productsHive');
  static Future<int> clearProducts() async =>await Hive.box('productsHive').clear();
}