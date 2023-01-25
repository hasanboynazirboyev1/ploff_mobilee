import 'package:ploff_mobile/features/home/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/home/domain/entitity/category_entity.dart';
import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';
import 'package:ploff_mobile/features/home/domain/repositor/product_repository.dart';

class ProductRepo extends ProductRepository {
  @override
  Future<List<CategorysEntity>> getProducts() async {
    final datas = await ProductApi.getProducts();
    final productdata = await ProductApi.getProducts();
    final products = productdata.map((e) => ProductEntity(
          id: e.id,
          title: e.title!.ru,
        ));
    final category = datas
        .map((e) => CategorysEntity(
              id: e.id,
              title: DescriptionEntity(ru: e.title!.ru),
              products: products.toList(),
            ))
        .toList();

    return category;
  }
}
