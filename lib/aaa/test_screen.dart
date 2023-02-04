// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
// import 'package:ploff_mobile/features/order/data/models/product_order_model.dart';

// class TestClass extends StatefulWidget {
//    TestClass({super.key});

//   @override
//   State<TestClass> createState() => _TestClassState();
// }

// class _TestClassState extends State<TestClass> {
//     // late ProductOrderModeli productOrderModeli;
//    tengla()async{
//     productOrderModeli = await DesigOrderApi.getOrder();
//     setState(() {
      
//     });

//    }
//    @override
//   void initState() {
//     tengla();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(itemBuilder: ((context, index) {
//         // return ListTile(leading: Text(index.toString()),title: Text(productOrderModeli.orders![index].externalOrderId!),);
//       // }),itemCount: (productOrderModeli.orders ?? []).length),
//       floatingActionButton: FloatingActionButton(onPressed: () {
        
//       },),
//     );
//   }
// }