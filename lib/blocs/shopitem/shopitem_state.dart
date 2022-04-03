part of 'shopitem_bloc.dart';

@immutable
abstract class ShopitemState {}

class ShopitemInitial extends ShopitemState {}

class ShopitemsRetrieved extends ShopitemState {
  final List<ShopItem> shopItems;
  ShopitemsRetrieved({
    required this.shopItems,
  });
}

class ShopitemError extends ShopitemState {
  final String error;
  ShopitemError({required this.error});
}
