import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';

import '../../../../constants/app_constatnts.dart';

class PaymentTypeWidget extends StatelessWidget {
  const PaymentTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final designOrderBloc = context.read<DesignOrderBloc>();
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Тип оплаты',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const Gap(16),
                ListView.separated(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final nearest = state.nearestBranchModel!.branches[index];
                    return ListTile(
                      onTap: () {
                        designOrderBloc.add(CheckBoxPaymentlEvent(index));
                      },
                      leading: SvgPicture.asset(state.imagePath[index]),
                      title: Text(state.paymentList[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                      trailing: SvgPicture.asset(state.checkPayments[index]
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
