import 'package:ploff_mobile/core/usecase/usecase_product.dart';
import 'package:ploff_mobile/data/repository/product_repo.dart';
import 'package:ploff_mobile/domain/entites/product_entity.dart';

class ProductUsecase extends UseCaseProduct {
  ProductRepo repo;
  ProductUsecase({required this.repo});

  @override
  Future<List<ProductEntity>> call(params) async {
    final result = await repo.getProducts();
    return result;
  }
}