import 'package:get_it/get_it.dart';
import 'package:store/pages/basket/model/ShoppingBasketData.dart';
import 'package:store/pages/basket/model/ShoppingBasketDataImp.dart';


GetIt getIt = GetIt.I;

setupServiceLocator() {
  getIt.registerSingleton<ShoppingBasketData>(ShoppingBasketDataImp());
}
