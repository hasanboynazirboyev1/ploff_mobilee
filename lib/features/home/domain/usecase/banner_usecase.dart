import 'package:ploff_mobile/core/usecase/usecase.dart';
import 'package:ploff_mobile/data/repository/banner_repo.dart';
import 'package:ploff_mobile/features/home/domain/entitity/banner_entity.dart';

class BannerUseCase extends UseCase {
  BannerRepo repo;
  BannerUseCase({required this.repo});

  @override
  Future<List<BannerEntity>> call(params) async {
    final result = await repo.getBanner();
    return result;
  }
}
