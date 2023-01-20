import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:openapi/auth-clients/poseidon-client.dart';
import 'package:openapi/custom-model/models.dart';
import 'package:openapi/providers/auth.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> _bestSellers = [];
  List<DiscountOfferDto>? _offers = [];
  List<ProductDto>? _offersProducts = [];
  WishListDetailsDto? _userWishList;
  int? _offerId;
  bool _recommendation = true;
  final ApiClients apiClients = ApiClients();
  final Auth auth;

  Products(this.auth, this._items);

  String? get token => auth.token;
  bool get recommendation => _recommendation;

  int? get offerId => _offerId;

  List<Product> get items {
    return [..._items];
  }

  List<DiscountOfferDto> get offers {
    return [..._offers!];
  }

  List<Product> get bestSellers {
    return [..._bestSellers];
  }

  List<ProductDto> get offersProducts {
    return [..._offersProducts!];
  }

  WishListDetailsDto? get wishList {
    return _userWishList;
  }

  void setOfferId(int offerId) {
    this._offerId = null;
    this._offerId = offerId;
  }

  List<Product> get favoriteItems {
    //TOFIX: _items.where((prodItem) => !prodItem.sysDeactivated!).toList();
    return _items.toList();
  }

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.productId == id);
  }

  Future<void> getAllOffers() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiDiscountofferQueryGet(1, 10,
        orderBy: 'sys_createdAt desc', filter: null);
    _offers = <DiscountOfferDto>[];
    _offers = result?.items ?? <DiscountOfferDto>[];
    {
      new DiscountOfferDto(
          description: 'No special offers available',
          discount: 0,
          startDate: DateTime.now(),
          endDate: DateTime.now());
    }
    ;

    notifyListeners();
  }

  Future<void> getRecommendationOrBestSellers() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);
    ProductDtoResponseData? result = null;

    result = await poseidonClient.apiRecommendProductsGet(1, 20,
        orderBy: null, filter: null);

    _recommendation = true;

    if (result == null || (result.items?.length ?? 0) == 0) {
      result = await poseidonClient.apiBestsellerProductsGet(1, 20,
          orderBy: "sys_CreatedAt desc", filter: null);
      _recommendation = false;
    }
    _bestSellers = <Product>[];
    result?.items?.forEach((data) => _bestSellers.add(Product(data)));
    notifyListeners();
  }

  Future<void> getOfferProducts() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiOfferProductsGet(_offerId!, 1, 20,
        orderBy: 'sys_createdAt desc', filter: null);

    _offersProducts = <ProductDto>[];
    _offersProducts = result?.items;

    notifyListeners();
  }

  Future<void> fetchAndSetProducts() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiProductQueryGet(1, 20,
        orderBy: 'sys_createdAt desc', filter: null);
    _items = <Product>[];
    result?.items?.forEach((data) => _items.add(Product(data)));

    notifyListeners();
  }

  Future<void> getProductsByQuery(Query query) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiProductQueryGet(
        query.page!, query.pageSize!,
        orderBy: query.orderBy, filter: query.filter);

    _items = <Product>[];
    result?.items?.forEach((data) => _items.add(Product(data)));

    notifyListeners();
  }

  Future<void> createWishList(int userId) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    await poseidonClient.apiWishlistUpsertPost(WishListCommand(
        description: 'Your wish list',
        title: 'Favorite items',
        userId: userId));
  }

  Future<void> addOrRemoveProductWishList(int productId) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);
    if (auth.userId == null) {
      await auth.getUserDetails();
    }

    if (_userWishList == null) {
      await getWishListForUser(notify: false);
    }
    var existing = await poseidonClient.apiWishlistitemQueryGet(1, 10,
        orderBy: null,
        filter:
            'wishListId=${_userWishList!.wishListId!},productId=${productId}');

    if (existing!.items!.length > 0) {
      await poseidonClient
          .apiWishlistitemDeleteDelete(existing.items!.first.wishListItemId!);
    } else {
      await poseidonClient.apiWishlistitemUpsertPost(WishListItemCommand(
          note: 'Favorite Item',
          quantity: 1,
          productId: productId,
          wishListId: _userWishList!.wishListId!));
    }

    notifyListeners();
  }

  Future<void> removeProductFromWishList(int wishListItemId) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    await poseidonClient.apiWishlistitemDeleteDelete(wishListItemId);

    await getWishListForUser(notify: false);
    notifyListeners();
  }

  Future<void> getWishListForUser({bool notify: true}) async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (auth.userId == null) {
      await auth.getUserDetails();
    }

    final wishList =
        await poseidonClient.apiWishlistDetailsGet(userId: auth.userId!);
    if (wishList?.items != null && wishList!.items!.length != 0) {
      _userWishList = wishList.items!.first;
    } else {
      await createWishList(auth.userId!);
      final wishList =
          await poseidonClient.apiWishlistDetailsGet(userId: auth.userId!);
      if ((wishList?.items?.length ?? 0) == 0) {
        throw new Exception("Application is not able to fetch users wish list");
      }
      _userWishList = wishList!.items!.first;
    }
    if (notify) {
      notifyListeners();
    }
  }

  bool isFavorite(int? productId) {
    if (productId == null) {
      return false;
    }
    if (wishList?.wishListItem == null || wishList!.wishListItem!.length < 1) {
      return false;
    } else {
      return wishList!.wishListItem!.any((e) => e.productId == productId);
    }
  }
}
