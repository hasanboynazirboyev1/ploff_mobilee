

import 'package:ploff_mobile/features/home/domain/entitity/banner_entity.dart';

abstract class BannerRepository<T, P> {
  Future<List<BannerEntity>> getBanner();
}