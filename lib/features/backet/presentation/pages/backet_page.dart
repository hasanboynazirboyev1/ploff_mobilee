import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';

class BacketPage extends StatefulWidget {
  const BacketPage({super.key});

  @override
  State<BacketPage> createState() => _BacketPageState();
}

class _BacketPageState extends State<BacketPage> {
  late List<Map<String, dynamic>> itemms;
  @override
  void initState() {
    itemms = [];
    getItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getItem();
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        actions: [
          IconButton(
              onPressed: (() {
                getItem();
                setState(() {});
              }),
              icon: SvgPicture.asset(
                  'assets/svg_icons/order_icons/ic_delate.svg')),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: itemms.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Gap(0),
                    Column(
                      children: [
                        Image.asset('assets/img/backet_default.png'),
                        const Gap(24),
                        const Text('В корзине пока нет продукты'),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.height, 48)),
                        onPressed: (() async {
                          setState(() {});
                        }),
                        child: const Text('Продолжить')),
                  ],
                )
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(itemms[index]['title']),
                      subtitle: Text(itemms[index]['outPrice']),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return Gap(12);
                  }),
                  itemCount: itemms.length)),
    );
  }

  getItem() async {
    await Hive.openBox('productDb');
    var productHiveDb = Hive.box('productDb');

    final data = productHiveDb.keys.map((key) {
      final item = productHiveDb.get(key);
      return {"key": key, "title": item["title"], "outPrice": item["outPrice"]};
    }).toList();

    setState(() {
      itemms = data.reversed.toList();
    });

    // print("$itemms*****************");
  }
}
