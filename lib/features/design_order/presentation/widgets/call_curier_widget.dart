import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';

class CallCurierWidget extends StatelessWidget {
  const CallCurierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final designOrderBloc = context.read<DesignOrderBloc>();
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Хотели бы что бы вам позвонил курьер?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const Gap(16),
                ListView.separated(
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {
                        designOrderBloc.add(CheckBoxCurierEvent(index));
                      },
                      title: Text(
                        index == 0 ? 'Да' : 'Нет',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      leading: SvgPicture.asset(state.checkCurier![index]
                          ? 'assets/svg_icons/design_order_icon/ic_active.svg'
                          : 'assets/svg_icons/design_order_icon/ic_nonactive.svg'),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(thickness: 1);
                  },
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
