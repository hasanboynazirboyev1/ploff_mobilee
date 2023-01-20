import 'package:ploff_mobile/features/home/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';
import 'package:ploff_mobile/features/home/domain/repositor/product_repository.dart';

class ProductRepo extends ProductRepository {
  @override
  Future<List<ProductEntity>> getProducts() async {
    final datas = await ProductApi.getProducts();
    final product = datas
        .map((e) => ProductEntity(
              active: e.active,
              activeInMenu: e.activeInMenu,
              brandId: e.brandId,
              categories: e.categories,
              currency: e.currency,
              fromTime: e.fromTime,
              gallery: e.gallery,
              hasModifier: e.hasModifier,
              id: e.id,
              iikoId: e.iikoId,
              image: e.image,
              jowiId: e.jowiId,
              offAlways: e.offAlways,
              outPrice: e.outPrice,
              rateId: e.rateId,
              string: e.string,
              toTime: e.toTime,
              type: e.type,
              description: e.description!.ru,
              title: e.title!.ru,
            ))
        .toList();
    return product;
  }
}
