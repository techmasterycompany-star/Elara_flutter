import 'package:flutter/foundation.dart';

import '../models/product.dart';

@immutable
class CartItem {
  const CartItem({required this.product, required this.quantity});

  final Product product;
  final int quantity;

  double get subtotal => product.price * quantity;

  CartItem copyWith({int? quantity}) =>
      CartItem(product: product, quantity: quantity ?? this.quantity);
}

class ShopManager extends ChangeNotifier {
  ShopManager._();

  static final ShopManager instance = ShopManager._();

  factory ShopManager() => instance;

  final Map<String, CartItem> _cart = <String, CartItem>{};

  final Map<String, Product> _favorites = <String, Product>{};

  // ==================== Cart ====================

  List<CartItem> get cartItems => List.unmodifiable(_cart.values);

  int get cartItemCount =>
      _cart.values.fold(0, (sum, item) => sum + item.quantity);

  double get cartTotal =>
      _cart.values.fold(0.0, (sum, item) => sum + item.subtotal);

  int quantityInCart(String productId) => _cart[productId]?.quantity ?? 0;

  bool isInCart(String productId) => _cart.containsKey(productId);

  bool addToCart(Product product, {int quantity = 1}) {
    if (!product.isInStock || quantity <= 0) return false;

    final current = _cart[product.id]?.quantity ?? 0;
    final next = (current + quantity).clamp(0, product.stock);
    if (next == current) return false;

    _cart[product.id] = CartItem(product: product, quantity: next);
    notifyListeners();
    return true;
  }

  void setQuantity(String productId, int quantity) {
    final item = _cart[productId];
    if (item == null) return;

    final next = quantity.clamp(0, item.product.stock);
    if (next == 0) {
      _cart.remove(productId);
    } else {
      _cart[productId] = item.copyWith(quantity: next);
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.remove(productId) != null) notifyListeners();
  }

  void clearCart() {
    if (_cart.isEmpty) return;
    _cart.clear();
    notifyListeners();
  }

  // ==================== Favourites ====================

  List<Product> get favoriteProducts => List.unmodifiable(_favorites.values);

  int get favoriteCount => _favorites.length;

  bool isFavorite(Product product) => _favorites.containsKey(product.id);

  void toggleFavorite(Product product) {
    if (_favorites.remove(product.id) == null) {
      _favorites[product.id] = product;
    }
    notifyListeners();
  }
}
