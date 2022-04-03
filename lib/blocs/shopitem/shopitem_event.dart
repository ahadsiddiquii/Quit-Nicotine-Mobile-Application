part of 'shopitem_bloc.dart';

@immutable
abstract class ShopitemEvent {}

class GetShopItems extends ShopitemEvent {}

class ResetShopItemState extends ShopitemEvent {}
