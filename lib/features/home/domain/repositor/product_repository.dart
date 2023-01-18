

import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';

abstract class ProductRepository<T, P> {
  Future<List<ProductEntity>> getProducts();
}