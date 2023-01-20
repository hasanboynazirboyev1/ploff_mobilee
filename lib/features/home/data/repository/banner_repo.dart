import 'package:ploff_mobile/features/home/data/datasourse/remote/banner_api.dart';
import 'package:ploff_mobile/features/home/domain/entitity/banner_entity.dart';
import 'package:ploff_mobile/features/home/domain/repositor/banner_repository.dart';

class BannerRepo extends BannerRepository {
  @override
  Future<List<BannerEntity>> getBanner() async {
    final datas = await BannersApi.getBanners();
    final banner = datas
        .map((e) => BannerEntity(
            about: e.about,
            active: e.active,
            createdAt: e.createdAt,
            id: e.id,
            image: e.image,
            position: e.position,
            shipperId: e.shipperId,
            updatedAt: e.updatedAt,
            url: e.url))
        .toList();
    return banner;
  }
}
