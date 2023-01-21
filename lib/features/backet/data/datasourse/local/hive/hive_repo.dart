
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:ploff_mobile/features/home/data/datasourse/remote/one_product_api.dart';
import 'package:ploff_mobile/features/home/data/models/one_product_model.dart';

import 'hive_boxses.dart';

class HiveRepo {
  static setHive({OneProductModel? oneProductModel}) async {
    final prod = oneProductModel;

    final productDatas = OneProductModelHive(
        id: prod!.id,
        slug: prod.slug,
        title: prod.title.ru,
        code: prod.code,
        description: prod.description.ru,
        isDivisible: prod.isDivisible,
        count: prod.count,
        tags: prod.tags,
        inPrice: prod.inPrice,
        outPrice: prod.outPrice,
        image: prod.image,
        gallery: prod.gallery,
        favourites: prod.favourites,
        active: prod.active,
        order: prod.order,
        createdAt: prod.order,
        iikoId: prod.iikoId,
        jowiId: prod.jowiId,
        shipperId: prod.shipperId,
        priceChangers: prod.priceChangers,
        currency: prod.currency,
        type: prod.type,
        properties: prod.properties,
        productProperty: prod.productProperty,
        iikoSourceActionId: prod.iikoSourceActionId,
        iikoGroupId: prod.iikoGroupId,
        activeInMenu: prod.activeInMenu,
        offAlways: prod.offAlways,
        fromTime: prod.fromTime,
        toTime: prod.toTime,
        ikpu: prod.ikpu,
        packageCode: prod.packageCode,
        variantProducts: prod.variantProducts,
        parentId: prod.parentId,
        hasModifier: prod.hasModifier,
        rkeeperId: prod.rkeeperId);
    final productBox = HiveBoxses.getData();
    productBox.put(oneProductModel!.id, productDatas);
  }
}
