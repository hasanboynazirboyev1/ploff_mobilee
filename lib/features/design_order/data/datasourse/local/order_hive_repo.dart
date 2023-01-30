import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_mobile/features/design_order/data/datasourse/local/order_hive_box.dart';
import 'package:ploff_mobile/features/design_order/data/datasourse/local/order_datas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHiveRepo {
  static setOrderHive() async {
    final orderData = OrderDatasModel(
        apartment: 'aaaaw',
        branchId: '',
        building: '',
        clientId: '',
        coDeliveryPrice: 1,
        deliveryTime: '',
        deliveryType: '',
        description: '',
        descriptionProduct: '',
        descriptionStep: '',
        extraPhoneNumber: '',
        floor: '',
        futureTime: '',
        isCourierCall: true,
        lat: 1,
        long: 1,
        orderModifiers: [],
        paid: true,
        paymentType: '',
        price: '',
        productId: '',
        quantity: 1,
        source: '',
        statusId: '',
        toAddress: '',
        type: '',
        variants: []);
    final orderBox = OrderHiveBoxSingle.getData();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final customerID = prefs.getString('customer_id');

    orderBox.put(customerID, orderData);
    
  }
}
