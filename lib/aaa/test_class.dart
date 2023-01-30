import 'package:ploff_mobile/features/backet/data/datasourse/remote/one_product_api.dart';
import 'package:ploff_mobile/features/design_order/data/datasourse/local/order_datas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/design_order/data/datasourse/local/order_hive_box.dart';

class TestClass {
  static testFunc() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final customerID = prefs.getString('customer_id');
    final orderBox = OrderHiveBoxSingle.getData().get(customerID);

    Map<String, dynamic> map = {
      "apartment": orderBox!.apartment ?? '',
      "building": orderBox.building ?? '',
      "client_id": orderBox.clientId ?? '',
      "co_delivery_price": orderBox.coDeliveryPrice ?? '',
      "delivery_time": orderBox.deliveryTime ?? '',
      "delivery_type": orderBox.deliveryType ?? '',
      "description": orderBox.description ?? '',
      "is_courier_call": orderBox.isCourierCall ?? true,
      "extra_phone_number": orderBox.extraPhoneNumber ?? '',
      "floor": orderBox.floor ?? '',
      "paid": orderBox.paid ?? false,
      "payment_type": orderBox.paymentType ?? 'cash',
      "source": "android",
      "status_id": orderBox.statusId,
      "steps": [
        {
          "branch_id": orderBox.branchId,
          "description": orderBox.descriptionStep,
          "products": [
            {
              "description": orderBox.descriptionProduct,
              "type": orderBox.type,
              "price": orderBox.price,
              "product_id": orderBox.productId,
              "quantity": orderBox.quantity,
              "order_modifiers": orderBox.orderModifiers,
              "variants": orderBox.variants,
            }
          ]
        }
      ],
      "to_address": orderBox.toAddress,
      "to_location": {"lat": orderBox.lat, "long": orderBox.long},
      "future_time": null
    };
    return map;
  }
}
