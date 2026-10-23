import 'package:flutter/foundation.dart';

import '../data/models/skincare_product.dart';

/// One line in the cart: a product plus how many units were picked.
@immutable
class CartItem {
  const CartItem({required this.product, required this.quantity});

  final SkincareProduct product;
  final int quantity;

  double get subtotal => product.price * quantity;

  CartItem copyWith({int? quantity}) =>
      CartItem(product: product, quantity: quantity ?? this.quantity);
}

/// App-wide cart and favourites state.
///
/// Singleton: [ShopManager.instance] is the one shared object every screen
/// reads and writes, so the card, the details page and the app bar all stay in
/// sync. Widgets listen with a [ListenableBuilder] and rebuild on
/// [notifyListeners].
///
/// TODO: Persist the cart/favourites (shared_preferences) or move this behind
/// `flutter_bloc` once the real API is in place.
class ShopManager extends ChangeNotifier {
  ShopManager._();

  static final ShopManager instance = ShopManager._();

  /// Convenience so `ShopManager()` also returns the singleton.
  factory ShopManager() => instance;

  final Map<String, CartItem> _cart = <String, CartItem>{};

  /// Keyed by product id so a product is stored at most once. Insertion order
  /// is preserved, which is the order they were favourited in.
  final Map<String, SkincareProduct> _favorites = <String, SkincareProduct>{};

  // ==================== Cart ====================

  List<CartItem> get cartItems => List.unmodifiable(_cart.values);

  /// Total number of units in the cart (not the number of lines).
  int get cartItemCount => _cart.values.fold(0, (sum, item) => sum + item.quantity);

  double get cartTotal =>
      _cart.values.fold(0.0, (sum, item) => sum + item.subtotal);

  int quantityInCart(String productId) => _cart[productId]?.quantity ?? 0;

  bool isInCart(String productId) => _cart.containsKey(productId);

  /// Adds [quantity] units of [product], never exceeding the available stock.
  ///
  /// Returns `true` when the cart changed, `false` when the product is sold
  /// out or the stock limit was already reached.
  bool addToCart(SkincareProduct product, {int quantity = 1}) {
    if (!product.isInStock || quantity <= 0) return false;

    final current = _cart[product.id]?.quantity ?? 0;
    final next = (current + quantity).clamp(0, product.stock);
    if (next == current) return false;

    _cart[product.id] = CartItem(product: product, quantity: next);
    notifyListeners();
    return true;
  }

  /// Sets an exact quantity; `0` removes the line. Clamped to the stock.
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

  /// Every favourited product, in the order they were saved.
  List<SkincareProduct> get favoriteProducts =>
      List.unmodifiable(_favorites.values);

  int get favoriteCount => _favorites.length;

  bool isFavorite(SkincareProduct product) => _favorites.containsKey(product.id);

  /// Adds the product to favourites, or removes it when already saved.
  void toggleFavorite(SkincareProduct product) {
    if (_favorites.remove(product.id) == null) {
      _favorites[product.id] = product;
    }
    notifyListeners();
  }
}
