import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapFunc {
  static mapControlFunc(
      {lat,
      long,
      YandexMapController? ycontroller,
      List<MapObject>? mapObjects,
      MapObjectId? mapObjectId}) async {
    await ycontroller!.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(
      latitude: lat,
      longitude: long,
    ))));
    await ycontroller.getMinZoom();
    if (mapObjects!.any((el) => el.mapId == mapObjectId!)) {
      return;
    }

    final mapIcon = PlacemarkMapObject(
      mapId: mapObjectId!,
      point: Point(latitude: lat, longitude: long),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage(
            'assets/svg_icons/order_icons/route_start.png'),
        anchor: const Offset(0.5, 0.5),
      )),
      opacity: 0.7,
    );

    mapObjects.add(mapIcon);
  }

  static updateFunc(
      {lat, long, List<MapObject>? mapObjects, MapObjectId? mapObjectId}) {
    if (!mapObjects!.any((el) => el.mapId == mapObjectId)) {
      return;
    }

    final mapObjectWithCompositeIcon = mapObjects
        .firstWhere((el) => el.mapId == mapObjectId) as PlacemarkMapObject;

    mapObjects[mapObjects.indexOf(mapObjectWithCompositeIcon)] =
        mapObjectWithCompositeIcon.copyWith(
            point: Point(latitude: lat, longitude: long));
  }
}
