import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/yandex_map_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DesignFilialsWidget extends StatefulWidget {
  const DesignFilialsWidget({super.key});

  @override
  State<DesignFilialsWidget> createState() => _DesignFilialsWidgetState();
}

class _DesignFilialsWidgetState extends State<DesignFilialsWidget> {
  YandexMapController? ycontroller;
  // late Completer<YandexMapController> completer;

  @override
  void initState() {
    // completer = Completer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final designOrderBloc = context.read<DesignOrderBloc>();
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return Container(
            margin:const EdgeInsets.symmetric(vertical: 16),
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
                    onMapCreated: ((YandexMapController controller) async {
                      ycontroller = controller;
                    }),
                    onUserLocationAdded: (view) async {
                      return view.copyWith(
                          arrow: PlacemarkMapObject(
                              mapId: MapObjectId('user ob'),
                              point: Point(
                                latitude: state.latitude!,
                                longitude: state.longitude!,
                              )),
                              
                          pin: view.pin.copyWith(
                              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                                  image: BitmapDescriptor.fromAssetImage(
                                      "assets/svg_icons/order_icons/ic_location.svg")))));
                    },
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
                            CameraUpdate.newCameraPosition(CameraPosition(
                                target: Point(
                          latitude: state.latitude!,
                          longitude: state.longitude!,
                        ))));
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
