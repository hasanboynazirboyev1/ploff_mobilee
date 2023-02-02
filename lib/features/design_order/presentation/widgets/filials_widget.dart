import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/yandex_map_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DesignFilialsWidget extends StatefulWidget {
  const DesignFilialsWidget({super.key});

  @override
  State<DesignFilialsWidget> createState() => _DesignFilialsWidgetState();
}

class _DesignFilialsWidgetState extends State<DesignFilialsWidget> {
  YandexMapController? ycontroller;
  late List<MapObject> mapObjects;
  late PlacemarkMapObject mapIcon;
  late MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');
  late Point point;

  @override
  void initState() {
    point = const Point(latitude: 39.652451, longitude: 66.970139);
    mapIcon = PlacemarkMapObject(
      mapId: mapObjectId,
      point: point,
      zIndex: 20,
      opacity: 1,
      direction: 90,
      isDraggable: false,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            'assets/svg_icons/order_icons/location.png',
          ),
          rotationType: RotationType.noRotation,
        ),
      ),
    );
    mapObjects = [mapIcon];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final designOrderBloc = context.read<DesignOrderBloc>();
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ближайший филиал',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const Gap(16),
                Container(
                  height: 156,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: YandexMap(
                    mapObjects: mapObjects,
                    onMapCreated: ((YandexMapController controller) async {
                      ycontroller = controller;
                      controller.moveCamera(
                        animation: MapAnimation(type: MapAnimationType.smooth, duration: 2.0),
                        CameraUpdate.newCameraPosition(
                          CameraPosition(zoom: 15, target: point),
                        ),
                      );
                    }),
                  ),
                ),
                ListView.separated(
                  itemCount: state.nearestBranchModel!.branches.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final nearest = state.nearestBranchModel!.branches[index];
                    return ListTile(
                      onTap: () async {
                        await ycontroller!.moveCamera(
                          animation: MapAnimation(type: MapAnimationType.smooth, duration: 2.0),
                            CameraUpdate.newCameraPosition(CameraPosition(
                                target: Point(
                          latitude: state.latitude!,
                          longitude: state.longitude!,
                        ))));
                        if (!mapObjects.any((el) => el.mapId == mapObjectId)) {
                          return;
                        }

                        final mapObjectWithCompositeIcon = mapObjects
                                .firstWhere((el) => el.mapId == mapObjectId)
                            as PlacemarkMapObject;

                        mapObjects[mapObjects
                                .indexOf(mapObjectWithCompositeIcon)] =
                            mapObjectWithCompositeIcon.copyWith(
                                point: Point(
                                    latitude: state.latitude!,
                                    longitude: state.longitude!));
                        designOrderBloc.add(CheckBoxFilialEvent(index: index));
                      },
                      leading: Image.asset(
                          'assets/svg_icons/design_order_icon/ic_resturant.png'),
                      title: Text(nearest.name),
                      subtitle: Text(nearest.address),
                      trailing: SvgPicture.asset(state.checkBoleans[index]
                          ? 'assets/svg_icons/design_order_icon/ic_active.svg'
                          : 'assets/svg_icons/design_order_icon/ic_nonactive.svg'),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(thickness: 1);
                  },
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
