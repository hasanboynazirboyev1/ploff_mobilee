import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';

class CustomerTextfieldWidget extends StatelessWidget {
  const CustomerTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return Row(
            children: [
              SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width * .29,
                child: TextField(
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Подъезд",
                    hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff858585),
                        fontWeight: FontWeight.w400),
                    fillColor: const Color(0xffF5F5F5),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      
                      borderSide: BorderSide(color: yellowColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width * .29,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Этаж",
                    hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff858585),
                        fontWeight: FontWeight.w400),
                    fillColor: const Color(0xffF5F5F5),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: yellowColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width * .29,
                child: TextField(
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Квартира",
                    hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff858585),
                        fontWeight: FontWeight.w400),
                    fillColor: const Color(0xffF5F5F5),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: yellowColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
