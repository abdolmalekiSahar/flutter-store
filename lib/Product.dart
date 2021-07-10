class Product{
  String _productName;
  int _id;
  String _price;
  String _imgUrl;
  bool _off;
  String _description;

  Product(this._productName, this._id, this._price, this._imgUrl, this._off, this._description);

  String get description => _description;

  bool get off => _off;

  String get imgUrl => _imgUrl;

  String get price => _price;

  int get id => _id;

  String get productName => _productName;
}