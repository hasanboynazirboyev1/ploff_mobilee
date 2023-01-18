import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';


class ProductDataWidget extends StatelessWidget {
  const ProductDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
      if (state is HomePageState) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.products!.length,
            (context, index) {
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
                      state.products![index].title!.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff2B2A28),
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListView.separated(
                          itemCount: state.products!.length,
                          
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 120,
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state
                                              .products![index].title!
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff2B2A28),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(right: 16),
                                            width: 239,
                                            child: Text(
                                              state.products![index]
                                                  .description!
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff858585)),
                                            )),
                                        Text(
                                            state.products![index]
                                                .outPrice
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Container(
                                      width: 88,
                                      height: 88,
                                      decoration: BoxDecoration(
                                          image:const DecorationImage(
                                              image: AssetImage(
                                                  "assets/home_/123.jpg")),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: ((context, index) {
                            return const  Divider(thickness: 1,);
                          }),
                        )),
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
