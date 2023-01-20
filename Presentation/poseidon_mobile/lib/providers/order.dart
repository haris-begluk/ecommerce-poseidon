import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:openapi/auth-clients/poseidon-client.dart';
import 'package:openapi/providers/auth.dart';

class Order with ChangeNotifier {
  OrderDto? _orderDetails = null;
  List<OrderDto>? _userOrders = null;
  final ApiClients apiClients = ApiClients();
  final Auth auth;
  Order(this.auth, this._orderDetails);

  OrderDto? get order {
    return _orderDetails;
  }

  List<OrderDto> get userOrders {
    return _userOrders != null ? [..._userOrders!] : <OrderDto>[];
  }

  Future<void> loadClosedOrderDetails(int orderId) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiOrderQueryGet(1, 2,
        orderBy: 'sys_UpdatedAt desc',
        filter: 'orderId=$orderId,payedAndClosed=false');

    _orderDetails = result!.items!.first;
    notifyListeners();
  }

  Future<List<OrderDto>> getUserOrders() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiOrderQueryGet(1, 50,
        orderBy: 'sys_UpdatedAt desc', filter: 'userId=${auth.userId}');

    _userOrders = null;
    _userOrders = result?.items;
    notifyListeners();
    return result!.items!;
  }

  Future<OrderDto?> orderCheckout(
      int cartId, int? deliveryId, String? paymentMethod) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiOrderCreatePost(cartId,
        deliveryId: deliveryId, paymentMethod: paymentMethod);
    _orderDetails = result;
    return result;
  }

  Future<String> orderStripePayment(
      int orderId, int creditCardId, int deliveryId) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);
    try {
      await poseidonClient.apiStripePayPost(orderId, creditCardId, deliveryId);
    } catch (ex) {
      return 'Failed wiht error! Contact support.';
    }

    return "Order payed and closed.";
  }
}
