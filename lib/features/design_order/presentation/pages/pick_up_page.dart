import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_boxses.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/filials_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/payment_type_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/product_check_widget.dart';
import 'package:ploff_mobile/features/main_home/presentation/main_bloc/main_bloc.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../backet/data/datasourse/local/hive/hive_model.dart';

class PickUpPage extends StatelessWidget {
  const PickUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.read<OrderBloc>();
    final mainBloc = context.read<MainBloc>();
    final designOrderBloc = context.read<DesignOrderBloc>();
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return ListView(
            children: [
              const DesignFilialsWidget(),
              const PaymentTypeWidget(),
              ProductCheckWidget(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: whiteColor,
                  padding: EdgeInsets.all(16),
                  child: ElevatedButton(
                    child: Text('Оформить заказ'),
                    onPressed: () async {
                      designOrderBloc.add(GetOndemandOrderEvent());
                      mainBloc.add(Throw3pageEvent());
                      orderBloc.add(GetOrderDatasEvent(context));
                      HiveBoxses.getData().clear();
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
