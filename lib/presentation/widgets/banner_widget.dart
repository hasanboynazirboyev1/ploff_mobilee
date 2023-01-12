import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/blocs/home/home_bloc.dart';


class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
      if (state is HomePageState) {
        return SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 16, bottom: 12),
                  padding:const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 160,
                        child: PageView.builder(
                            itemCount: state.banner!.length,
                            onPageChanged: (value) {
                              homeBloc.add(BannerIndexEvent(value));
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(state.banner![index].image!)
                                )));
                            }),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 8,
                        child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.banner!.length,
                                shrinkWrap: true,

                                itemBuilder: (context, index) {
                                  return Center(
                                    child: InkWell(
                                      child: AnimatedContainer(
                                        duration:const  Duration(milliseconds: 200),
                                        margin:const EdgeInsets.only(right: 1),
                                        height: 4,
                                        width: state.bannerIndex != index ? 8 : 16,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                        color: state.bannerIndex != index
                                            ? grayColor
                                            : yellowColor,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                      ),
                    ],
                  )),
            ],
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
