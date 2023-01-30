import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ploff_mobile/features/design_order/data/datasourse/local/order_datas_model.dart';
import 'package:ploff_mobile/features/design_order/data/datasourse/local/order_hive_box.dart';
import 'package:ploff_mobile/features/design_order/data/datasourse/local/order_hive_repo.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/sign_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String? customerID;
  late YandexMapController yandexMapController;
 
 final List<MapObject> mapObjects = [];

  final MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');
  final MapObjectId mapObjectWithDynamicIconId = MapObjectId('dynamic_icon_placemark');
  final MapObjectId mapObjectWithCompositeIconId = MapObjectId('composite_icon_placemark');

  Future<Uint8List> _rawPlacemarkImage() async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    final size = Size(50, 50);
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final radius = 20.0;

    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);

    final image = await recorder.endRecording().toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 300,
          child: YandexMap(
            onMapCreated: (controller) {
              yandexMapController = controller;
            },
            mapObjects: mapObjects,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (mapObjects.any((el) => el.mapId == mapObjectId)) {
            return;
          }

          final mapObject = PlacemarkMapObject(
              mapId: mapObjectId,
              point: Point(latitude: 59.945933, longitude: 30.320045),
              
              opacity: 0.7,
              direction: 90,
              isDraggable: true,
             
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  image:
                      BitmapDescriptor.fromAssetImage('lib/assets/place.png'),
                  rotationType: RotationType.rotate)));

          setState(() {
            mapObjects.add(mapObject);
          });
        },
      ),
    );
  }
}
