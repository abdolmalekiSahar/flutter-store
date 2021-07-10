import 'package:flutter/material.dart';
import 'package:store/pages/basket/model/ShoppingBasketData.dart';


import 'package:store/service_locator/service_locator.dart';
import 'package:store/shoppingBasketItem.dart';

class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({Key? key}) : super(key: key);

  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  ShoppingBasketData shoppingBasketData = getIt<ShoppingBasketData>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "سبد خرید",
          style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BasketUI(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BasketUI() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: ListView.builder(
            itemCount: shoppingBasketData.basketItems.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Padding(
                  child: ShoppingBasketItem(
                      shoppingBasketData.basketItems[position],
                      removeItem,
                      position),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 85,
                child: Center(
                  child: Text(
                    "پرداخت",
                    style: TextStyle(
                        fontFamily: "Vazir", fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      shoppingBasketData.basketItems.removeAt(index);
    });
  }
}
