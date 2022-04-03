import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nicotine/models/ShopItem.dart';
import 'package:nicotine/resources/firebase_services/ShopItemFirestoreService.dart';

part 'shopitem_event.dart';
part 'shopitem_state.dart';

class ShopitemBloc extends Bloc<ShopitemEvent, ShopitemState> {
  ShopitemBloc() : super(ShopitemInitial());
  final shopItemFirestoreService = ShopItemFirestoreService();
  @override
  Stream<ShopitemState> mapEventToState(
    ShopitemEvent event,
  ) async* {
    if (event is GetShopItems) {
      try {
        print("ShopitemBloc: GetShopItems event");

        final shopItems = await shopItemFirestoreService.getShopItems();
        yield ShopitemsRetrieved(shopItems: shopItems);
      } catch (e) {
        print('Error in InsertAffirmation event: $e');
        yield ShopitemError(error: e.toString());
      }
    } else if (event is ResetShopItemState) {
      yield ShopitemInitial();
    }
  }
}
