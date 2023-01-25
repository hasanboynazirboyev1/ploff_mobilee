import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/pages/one_product_datas_page.dart';
import 'package:ploff_mobile/features/home/presentation/bloc/home_bloc.dart';

class ProductDatasWidget extends StatelessWidget {
  ProductDatasWidget({super.key, this.indexx});
  int? indexx;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomePageState) {
          return Container(
              padding: const EdgeInsets.only(top: 16),
              child: ListView.separated(
                itemCount:
                    state.products!.categories![indexx!].products!.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => BlocProvider(
                                    create: (context) => BacketBloc()..add(OneProductEvent(id: state.products!.categories![indexx!].products![index].id)),
                                    child: OneProductDatasPage(),
                                  ))));
                    },
                    child: SizedBox(
                      height: 120,
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.products!.categories![indexx!]
                                      .products![index].title!.ru
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
                                      state.products!.categories![indexx!]
                                          .products![index].description!.ru
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff858585)),
                                    )),
                                Text(
                                    state.products!.categories![indexx!]
                                        .products![index].outPrice
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
                                  image: const DecorationImage(
                                      image:
                                          AssetImage("assets/home_/123.jpg")),
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: ((context, index) {
                  return const Divider(
                    thickness: 1,
                  );
                }),
              ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
