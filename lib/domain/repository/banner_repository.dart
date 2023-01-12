

import 'package:ploff_mobile/domain/entites/banner_entity.dart';

abstract class BannerRepository<T, P> {
  Future<List<BannerEntity>> getBanner();
}