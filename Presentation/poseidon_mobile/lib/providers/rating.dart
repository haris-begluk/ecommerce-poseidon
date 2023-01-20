import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:openapi/auth-clients/poseidon-client.dart';
import 'package:openapi/providers/auth.dart';

class Rating with ChangeNotifier {
  UserProductReviewDto? _productRate;
  final ApiClients apiClients = ApiClients();
  final Auth auth;
  Rating(this.auth, this._productRate);

  UserProductReviewDto? get productRate => _productRate;

  Future<double> getProductRate(int productId) async {
    await loadProductReview(productId);
    notifyListeners();
    return double.parse((_productRate?.rating ?? 0).toString());
  }

  Future<void> loadProductReview(int productId) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (auth.userId == null) {
      await auth.getUserDetails();
    }

    final result = await poseidonClient.apiUserproductreviewQueryGet(1, 2,
        orderBy: 'sys_UpdatedAt desc',
        filter: 'productId=$productId,userId=${auth.userId}');

    _productRate = result?.items?.length == 0 ? null : result?.items?.first;
  }

  Future<void> postProductReview(int productId, double rate) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    await loadProductReview(productId);

    if (_productRate != null && _productRate?.productId == productId) {
      await poseidonClient
          .apiUserproductreviewUpsertPost(UserProductReviewCommand(
        userProductReviewId: _productRate!.userProductReviewId,
        rating: rate.toInt(),
      ));
    } else {
      await poseidonClient.apiUserproductreviewUpsertPost(
          UserProductReviewCommand(
              productId: productId,
              userId: auth.userId,
              rating: rate.toInt(),
              title: 'Product review',
              comment: ''));
    }
  }
}
