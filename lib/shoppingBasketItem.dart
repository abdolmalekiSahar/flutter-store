import 'package:flutter/material.dart';
import 'Product.dart';

typedef OnRemovePressed(int index);

// ignore: must_be_immutable
class ShoppingBasketItem extends StatefulWidget {

  Product _product;
  int _count = 0;
  int _index;
  OnRemovePressed _onRemovePressed;

  ShoppingBasketItem(this._product, this._onRemovePressed, this._index);

  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 40, left: 20),
              child: Image.network(
                widget._product.imgUrl,
                width: 100,
                height: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, right: 20),
                  child: Text(
                    widget._product.productName,
                    style: TextStyle(fontFamily: 'Vazir', fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.chevron_left, size: 35),
                        onTap: () {
                          Increment();
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget._count.toString(),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Icon(Icons.chevron_right, size: 35),
                        onTap: () {
                          Decrement();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.delete_outline),
                        onTap: () {
                          widget._onRemovePressed(widget._index);
                        },
                      ),
                      Text(
                        widget._product.price,
                        style: TextStyle(
                          fontFamily: 'Vazir',
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Increment() {
    setState(() {
      widget._count++;
    });
  }

  void Decrement() {
    setState(() {
      if (widget._count == 0)
        return;
      else {
        widget._count--;
      }
    });
  }
}
