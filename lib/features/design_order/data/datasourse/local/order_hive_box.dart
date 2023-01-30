import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_mobile/features/design_order/data/datasourse/local/order_datas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHiveBoxSingle{
  
   
  static Box<OrderDatasModel> getData() => Hive.box('orderDatasBox');
  static List<OrderDatasModel> getProduct(Box box) =>
      box.values.toList().cast<OrderDatasModel>();
}