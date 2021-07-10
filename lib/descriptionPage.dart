import 'package:flutter/material.dart';
import 'package:store/pages/basket/model/ShoppingBasketData.dart';

import 'package:store/service_locator/service_locator.dart';

import 'Product.dart';

class DescriptionPage extends StatelessWidget {
  // const DescriptionPage({Key? key}) : super(key: key);
  ShoppingBasketData shoppingBasketData = getIt<ShoppingBasketData>();

  Product _product;

  DescriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "فروشگاه",
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
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height+50,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'کفش',
                        style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.red[700],
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.network(
                    _product.imgUrl,
                    height: 280,
                    width: 280,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  _product.price,
                  style: TextStyle(
                    color: Colors.red[700],
                    fontFamily: "Vazir",
                    fontSize: 30,
                  ),
                ),
                Text(
                  _product.productName,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontFamily: "Vazir",
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45, right: 45),
                  child: Text(
                    _product.description,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      fontFamily: "Vazir",
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  child: GestureDetector(
                    onTap: () {
                      shoppingBasketData.basketItems.add(_product);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "${_product.productName}" +
                              ".به سبد خرید شما افزوده شد",
                          style: TextStyle(fontFamily: "Vazir", fontSize: 15),
                        ),
                      ));
                    },
                    child: Container(
                      
                      decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "افزودن به سبد خرید",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 50,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ));
  }
}
