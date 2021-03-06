import 'Product.dart';

class ShoppingBasketData {

  static late ShoppingBasketData _instance;
  List<Product> _basketItems = [];

  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }

  static ShoppingBasketData getInstance() {
    if (_instance == null) {
      _instance = ShoppingBasketData();
    }
      return _instance;
  }
}