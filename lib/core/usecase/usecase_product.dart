import 'package:ploff_mobile/domain/entites/product_entity.dart';

abstract class UseCaseProduct<T,P>{
  Future<List<ProductEntity>>call(P params);
}