
import 'package:store/Product.dart';

import 'ShoppingBasketData.dart';

class ShoppingBasketDataImp extends ShoppingBasketData{
  List<Product> _basketItems = [];

  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }
}
