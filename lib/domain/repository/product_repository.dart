

import 'package:ploff_mobile/domain/entites/product_entity.dart';

abstract class ProductRepository<T, P> {
  Future<List<ProductEntity>> getProducts();
}