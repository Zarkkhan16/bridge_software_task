import 'package:equatable/equatable.dart';

class CartProviderState extends Equatable{
  final int productId, quantity;

  const CartProviderState({
    required this.productId,
    required this.quantity,
  });


  CartProviderState copyWith({
    int? productId,
    int? quantity,
  }) {
    return CartProviderState(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [productId];
}