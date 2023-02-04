import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/design_order/data/models/customer_adress_model.dart';
import 'package:ploff_mobile/features/design_order/data/models/nearest_branch_model.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'design_order_event.dart';
part 'design_order_state.dart';

class DesignOrderBloc extends Bloc<DesignOrderEvent, DesignOrderState> {
  DesignOrderBloc() : super(DesignOrderInitial()) {
    on<DesignOrderEvent>((event, emit) {});
    on<DesignOrderInitialEvent>((event, emit) async {
      final NearestBranchModel getnearestBranch =
          await DesigOrderApi.getNearestBranch();
      final CustomerAdressModel customerAdres =
          await DesigOrderApi.getCustomerAdress();

      emit(DesignOrderHomeState(
        customerAdress: customerAdres,
        checkPayments: List.generate(3, (index) => index == 0 ? false : true),
        nearestBranchModel: getnearestBranch,
        checkBoleans:
            List.generate(getnearestBranch.branches.length, (index) => true),
        latitude: 41.311081,
        longitude: 69.240562,
        checkCurier: List.generate(2, (index) => index == 0 ? false : true),
        checkClock: List.generate(
          2,
          (index) => index == 0 ? false : true,
        ),
      ));
    });
    on<CheckBoxFilialEvent>((event, emit) async {
      final state = this.state as DesignOrderHomeState;
      state.checkBoleans[event.index!] = false;
      for (var i = 0; i < state.checkBoleans.length; i++) {
        if (i != event.index) {
          state.checkBoleans[i] = true;
        }
      }
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      preferences.setString(
        'branchId',
        state.nearestBranchModel!.branches[event.index!].id,
      );
      emit(state.copyWith(
          checkBoleans: state.checkBoleans,
          latitude:
              state.nearestBranchModel!.branches[event.index!].location.lat,
          longitude:
              state.nearestBranchModel!.branches[event.index!].location.long));
    });
    on<CheckBoxPaymentlEvent>((event, emit) async {
      final state = this.state as DesignOrderHomeState;
      state.checkPayments[event.index!] = false;
      for (var i = 0; i < state.checkPayments.length; i++) {
        if (i != event.index) {
          state.checkPayments[i] = true;
        }
      }

      emit(state.copyWith(checkPayments: state.checkPayments));
    });
    on<CheckBoxCurierEvent>((event, emit) async {
      final state = this.state as DesignOrderHomeState;
      state.checkCurier![event.index!] = false;
      for (var i = 0; i < state.checkCurier!.length; i++) {
        if (i != event.index) {
          state.checkCurier![i] = true;
        }
      }

      emit(state.copyWith(checkCurier: state.checkCurier));
    });
    on<CheckBoxClockEvent>((event, emit) {
      final state = this.state as DesignOrderHomeState;
      state.checkClock![event.index!] = false;
      for (var i = 0; i < state.checkClock!.length; i++) {
        if (i != event.index) {
          state.checkClock![i] = true;
        }
      }
      emit(state.copyWith(checkClock: state.checkClock));
    });
    on<GetOndemandOrderEvent>((event, emit) async {
      try {
        await DesigOrderApi.getOndemandOrder();
      } catch (e) {}
    });
  }
}
