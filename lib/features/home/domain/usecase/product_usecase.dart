
import 'package:ploff_mobile/features/home/data/repository/product_repo.dart';
import 'package:ploff_mobile/features/home/domain/entitity/category_entity.dart';
import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';

import '../../../../core/usecase/usecase.dart';

class ProductUsecase extends UseCase {
  ProductRepo repo;
  ProductUsecase({required this.repo});

  @override
  Future<List<CategorysEntity>> call(params) async {
    final result = await repo.getProducts();
    return result;
  }
}