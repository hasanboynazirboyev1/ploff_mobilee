import 'package:hive/hive.dart';
import 'package:ploff_mobile/features/home/data/datasourse/remote/one_product_api.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';

class HiveBoxses{
  static Box<OneProductModelHive> getData() => Hive.box('hiveProductBox');
}