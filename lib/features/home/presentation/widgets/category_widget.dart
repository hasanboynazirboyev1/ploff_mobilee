import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/remote/one_product_api.dart';
import 'package:ploff_mobile/features/backet/presentation/pages/one_product_datas_page.dart';
import 'package:ploff_mobile/features/home/presentation/widgets/product_datas_widget.dart';

import '../../data/models/one_product_model.dart';
import '../bloc/home_bloc.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int? categoryIndex;
  int? proudctIndex;
  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomePageState) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.products!.categories!.length,
            (context, index) {
              categoryIndex = index;
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.products!.categories![index].title!.ru.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff2B2A28),
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      child: ProductDatasWidget(indexx: index),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      } else {
        return Scaffold(
          body: Container(),
        );
      }
    });
  }
}
