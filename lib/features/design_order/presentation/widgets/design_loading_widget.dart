import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../pages/delivery_datas_page.dart';
import '../pages/pick_up_page.dart';

class DesignLoadingWidget extends StatefulWidget {
  const DesignLoadingWidget({super.key});

  @override
  State<DesignLoadingWidget> createState() => _DesignLoadingWidgetState();
}

class _DesignLoadingWidgetState extends State<DesignLoadingWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Оформить заказ",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.9),
                    color: const Color(0xfff5f5f5),
                  ),
                  child: SizedBox(
                    height: 28,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.93),
                        ),
                        controller: tabController,
                        onTap: (value) {},
                        tabs: const [
                          Text(
                            "Доставка",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Самовывоз",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.35),
            const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
    ;
  }
}
