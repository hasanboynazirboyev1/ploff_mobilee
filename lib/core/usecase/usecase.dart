import 'package:ploff_mobile/features/home/domain/entitity/banner_entity.dart';

abstract class UseCase<T,P>{
  Future<List<P>>call(P params);
}