import 'package:ploff_mobile/core/usecase/usecase_banner.dart';
import 'package:ploff_mobile/data/repository/banner_repo.dart';
import 'package:ploff_mobile/domain/entites/banner_entity.dart';

class BannerUseCase extends UseCaseBanner {
  BannerRepo repo;
  BannerUseCase({required this.repo});

  @override
  Future<List<BannerEntity>> call(params) async {
    final result = await repo.getBanner();
    return result;
  }
}