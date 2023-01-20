import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:openapi/auth-clients/poseidon-client.dart';
import 'package:openapi/providers/auth.dart';
import 'package:openapi/providers/product.dart';

class CartItem extends CartItemDto {
  CartItem(CartItemDto dto)
      : super(
          cartItemId: dto.cartItemId,
          cartId: dto.cartId,
          discountAmount: dto.discountAmount,
          imageUrl: dto.imageUrl,
          price: dto.price,
          productId: dto.productId,
          quantity: dto.quantity,
          sysCreatedAt: dto.sysCreatedAt,
          sysCreatedBy: dto.sysCreatedBy,
          sysUpdatedAt: dto.sysUpdatedAt,
          sysUpdatedBy: dto.sysUpdatedBy,
          taxAmount: dto.taxAmount,
          title: dto.title,
          unit: dto.unit,
        );
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];
  final ApiClients apiClients = ApiClients();
  final Auth auth;
  CartDetailsDto? _cart;
  Cart(this.auth, this._items);

  List<CartItem> get items {
    return [..._items];
  }

  CartDetailsDto? get cartDetails {
    return _cart;
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    return _cart?.total == null ? 0 : _cart!.total!.toDouble();
  }

  Future<int> loadActiveCartOrCreate() async {
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    final result = await poseidonClient.apiCartDetailsGet();

    _cart = result?.items?.first;
    _items = <CartItem>[];
    if (_cart?.cartItem != null || _cart?.cartItem!.length != 0) {
      _cart?.cartItem?.forEach((data) => _items.add(CartItem(data)));
    }
    notifyListeners();
    return _cart!.cartId!;
  }

  Future<void> increaseQuantityCartItem(int cartItemId) async {
    if (_cart == null) {
      await loadActiveCartOrCreate();
    }

    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (_items.any((p) => p.cartItemId == cartItemId)) {
      var existingCartItem =
          _items.firstWhere((p) => p.cartItemId == cartItemId);

      existingCartItem.quantity = existingCartItem.quantity! + 1;

      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
          cartItemId: existingCartItem.cartItemId,
          quantity: existingCartItem.quantity));
    } else {
      throw Exception("Item does not exist!");
    }
    await loadActiveCartOrCreate();
  }

  Future<void> addQuantityCartItem(int cartItemId) async {
    if (_cart == null) {
      await loadActiveCartOrCreate();
    }

    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (_items.any((p) => p.cartItemId == cartItemId)) {
      var existingCartItem =
          _items.firstWhere((p) => p.cartItemId == cartItemId);

      existingCartItem.quantity = existingCartItem.quantity! + 1;

      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
          cartItemId: existingCartItem.cartItemId,
          quantity: existingCartItem.quantity));
    } else {
      throw Exception("Item does not exist!");
    }

    await loadActiveCartOrCreate();
  }

  Future<void> addItemByProduct(Product product) async {
    if (_cart == null) {
      await loadActiveCartOrCreate();
    }

    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (_items.any((p) => p.productId == product.productId)) {
      var existingCartItem =
          _items.firstWhere((p) => p.productId == product.productId);

      existingCartItem.quantity = existingCartItem.quantity! + 1;

      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
          cartItemId: existingCartItem.cartItemId,
          quantity: existingCartItem.quantity));
    } else {
      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
          productId: product.productId,
          cartId: _cart!.cartId,
          title: product.name,
          price: product.price,
          imageUrl: product.imageUrl,
          unit: product.unit,
          quantity: 1));
    }

    await loadActiveCartOrCreate();
  }

  Future<void> updateItemByProduct(Product product, {num quantity = 1}) async {
    if (_cart == null) {
      await loadActiveCartOrCreate();
    }

    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (_items.any((p) => p.productId == product.productId)) {
      var existingCartItem =
          _items.firstWhere((p) => p.productId == product.productId);

      existingCartItem.quantity = quantity;

      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
          cartItemId: existingCartItem.cartItemId,
          quantity: existingCartItem.quantity));
    } else {
      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
          productId: product.productId,
          cartId: _cart!.cartId,
          title: product.name,
          price: product.price,
          imageUrl: product.imageUrl,
          unit: product.unit,
          quantity: quantity));
    }

    await loadActiveCartOrCreate();
  }

  Future<void> removeFromCart(int cartItemId) async {
    if (!_items.any((p) => p.cartItemId == cartItemId)) {
      return;
    }
    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    await poseidonClient.apiCartDeleteDelete(cartItemId);

    await loadActiveCartOrCreate();
  }

  Future<void> decreaseOrRemove(int cartItemId) async {
    if (!_items.any((p) => p.cartItemId == cartItemId)) {
      return;
    }
    var existingCartItem = _items.firstWhere((p) => p.cartItemId == cartItemId);

    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (existingCartItem.quantity! > 1) {
      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
        cartItemId: existingCartItem.cartItemId,
        quantity: existingCartItem.quantity! - 1,
      ));
    } else {
      await poseidonClient.apiCartDeleteDelete(existingCartItem.cartItemId!);
    }

    await loadActiveCartOrCreate();
  }

  Future<void> removeSingleItemByProduct(int productId) async {
    if (!_items.any((p) => p.productId == productId)) {
      return;
    }
    var existingCartItem = _items.firstWhere((p) => p.productId == productId);

    PoseidonApiApi poseidonClient =
        this.apiClients.createPoseidonClient(this.auth);

    if (existingCartItem.quantity! > 1) {
      await poseidonClient.apiCartitemUpsertPost(CartItemCommand(
        cartItemId: existingCartItem.cartItemId,
        quantity: existingCartItem.quantity! - 1,
      ));
    } else {
      await poseidonClient
          .apiCartitemDeleteDelete(existingCartItem.cartItemId!);
    }

    await loadActiveCartOrCreate();
  }

  void clear() {
    _cart = null;
    _items = [];
    notifyListeners();
  }

  num getItemQuantity(Product product) {
    if (_items.any((p) => p.productId == product.productId)) {
      var existingCartItem =
          _items.firstWhere((p) => p.productId == product.productId);

      return existingCartItem.quantity ?? 1;
    } else {
      return 1;
    }
  }
}
