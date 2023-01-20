import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:openapi/auth-clients/poseidon-client.dart';
import 'package:openapi/providers/auth.dart';

class Checkout with ChangeNotifier {
  int? deliveryId;
  int? creditCardId;

  List<DeliveryDto>? deliveryItems = null;
  List<CreditCardDto>? creditCards = null;
  final ApiClients apiClients = ApiClients();

  Auth auth;
  Checkout(this.auth, this.deliveryId, this.creditCardId, this.deliveryItems,
      this.creditCards);

  int? get delivery {
    return deliveryId;
  }

  int? get creditCardID {
    return this.creditCardId;
  }

  void setDelivery(int id) {
    this.deliveryId = id;
  }

  void setPayment(int id) {
    this.creditCardId = id;
  }

  Future<void> getDeliveries() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiDeliveryQueryGet(1, 10,
        orderBy: 'sys_UpdatedAt desc');
    deliveryItems = result!.items;
    notifyListeners();
  }

  Future<void> getUserCreditCards() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    var user = await this.auth.getUserDetails();

    final result = await poseidonClient.apiCreditcardQueryGet(1, 10,
        orderBy: 'sys_UpdatedAt desc', filter: 'userId=${user.userId}');

    this.creditCards = result!.items;
    notifyListeners();
  }

  Future<void> addUserCreditCards(
      String cardNumber, String cvc, DateTime expDate) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    var user = await this.auth.getUserDetails();

    await poseidonClient.apiCreditcardUpsertPost(new CreditCardCommand(
      cvc: cvc,
      creaditCartNumber: cardNumber,
      expirationDate: expDate,
      imageUrl: '',
      paymentProviderId:
          1, // For now because we only use Stripe as provider and it will be the first one in the database
      userId: user.userId,
    ));
    notifyListeners();
  }
}
