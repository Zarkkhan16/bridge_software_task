import 'package:bridge_software_task/providers/cart/cart_provider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartProvider, Set<CartProviderState>>((ref) {
  return CartProvider({});
});

class CartProvider extends StateNotifier<Set<CartProviderState>> {
  CartProvider(super.createFn);

  void addToCart(int productId) {
    state = {
      ...state,
      CartProviderState(productId: productId, quantity: 1),
    };
  }

  void removeFromCart(int productId) {
    state.removeWhere((element) => element.productId == productId);
    state = {...state};
  }

  void increment(int productId) {
    final index = state.toList().indexWhere((element) => element.productId == productId);
    final updatedState = state.elementAt(index).copyWith(quantity: state.elementAt(index).quantity + 1);

    state.remove(updatedState);
    final list = state.toList();
    list.insert(index, updatedState);

    state = {...list.toSet()};
  }

  void decrement(int productId) {
    final index = state.toList().indexWhere((element) => element.productId == productId);
    final updatedState = state.elementAt(index).copyWith(quantity: state.elementAt(index).quantity - 1);

    state.remove(updatedState);
    if (updatedState.quantity > 0) {
      final list = state.toList();
      list.insert(index, updatedState);
      state = list.toSet();
    }

    state = {...state};
  }
}
