import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';

class HiveExam extends StatefulWidget {
  HiveExam({super.key});

  @override
  State<HiveExam> createState() => _HiveExamState();
}

class _HiveExamState extends State<HiveExam> {

  hiveInit()async{
    await Hive.openBox('productDb');
  }

  openHiveBox() async {
    var box = Hive.box('productDb');

    await box.add({"bb": "bb"});
    item = box.keys.map((key) {
      final item = box.get(key);
      return {"key": key, "bb": item["bb"]};
    }).toList();
  }

  List<Map<String, dynamic>> item = [];

  @override
  void initState() {
    hiveInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('add'),
              onPressed: () async {
                var box = Hive.box('productDb');
                print("***********************   ${box.length}");
                print(box.values);
                print(box.getAt(2));
                setState(() {
                  // item.reversed.toList();
                });


              },
            ),
            ElevatedButton(
              child: Text('print '),
              onPressed: () async {
                print(item[2].toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await openHiveBox();
        },
      ),
    );
  }
}
