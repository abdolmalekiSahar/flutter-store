import 'package:store/Product.dart';

abstract class ShoppingBasketData{
  List<Product> get basketItems;
  set basketItems(List<Product> value);
  }