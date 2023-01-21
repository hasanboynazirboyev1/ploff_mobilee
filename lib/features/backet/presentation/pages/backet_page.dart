import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_boxses.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveExam extends StatefulWidget {
  HiveExam({super.key});

  @override
  State<HiveExam> createState() => _HiveExamState();
}

class _HiveExamState extends State<HiveExam> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BacketBloc, BacketState>(
      builder: (context, state) {
        if (state is BacketHomeState) {
          return Scaffold(
            appBar: AppBar(),
            body: ValueListenableBuilder(
              valueListenable: HiveBoxses.getData().listenable(),
              builder: (BuildContext context, Box<OneProductModelHive> box,
                  Widget? child) {
                List<OneProductModelHive> products =
                    box.values.toList().cast<OneProductModelHive>();
                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(products[index].title),
                        subtitle: Text(products[index].createdAt),
                      );
                    }));
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
