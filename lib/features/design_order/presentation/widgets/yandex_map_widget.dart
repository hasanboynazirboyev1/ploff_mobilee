// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ploff_mobile/constants/app_constatnts.dart';
// import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';

// class YandexMapWidget extends StatefulWidget {
//   YandexMapWidget({super.key, this.controller});
//   YandexMapController? controller;
//   @override
//   State<YandexMapWidget> createState() => _YandexMapWidgetState();
// }

// class _YandexMapWidgetState extends State<YandexMapWidget> {

//   @override
//   void initState() {

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DesignOrderBloc, DesignOrderState>(
//       builder: (context, state) {
//         if (state is DesignOrderHomeState) {
//           return Container(
//             height: 156,
//             decoration: BoxDecoration(
//               color: whiteColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: SizedBox(
//               height: 156,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 100,
//                     child: YandexMap(
//                       onMapCreated: ((YandexMapController controller) async {
//                         widget.controller = controller;
//                         await controller.moveCamera(
//                             CameraUpdate.newCameraPosition(CameraPosition(
//                                 target: Point(
//                                     latitude: 41.311081,
//                                     longitude: 69.240562))));
//                       }),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return SizedBox();
//         }
//       },
//     );
//   }
// }
// // BoundingBox(northEast: Point(latitude: 41.311081,longitude: 69.240562 ), southWest: Point(latitude: 41.311081,longitude: 69.240562))