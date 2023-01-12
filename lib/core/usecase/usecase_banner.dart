import 'package:ploff_mobile/domain/entites/banner_entity.dart';

abstract class UseCaseBanner<T,P>{
  Future<List<BannerEntity>>call(P params);
}