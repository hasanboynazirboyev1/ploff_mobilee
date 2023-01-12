import 'package:ploff_mobile/data/datasouse/remote/banner_api.dart';
import 'package:ploff_mobile/domain/entites/banner_entity.dart';
import 'package:ploff_mobile/domain/repository/banner_repository.dart';

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
