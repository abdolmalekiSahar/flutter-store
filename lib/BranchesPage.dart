import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart';
import 'package:store/pages/basket/ShoppingBasket.dart';
import 'dart:convert';
import 'branch.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({Key? key}) : super(key: key);

  @override
  _BranchesPageState createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> {
  Set<Marker> _branchesList = {};
  Completer<GoogleMapController> _controller = Completer();

  void onComplete(GoogleMapController controller) {
    _controller.complete();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "شعبه های فروشگاه",
          style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ShoppingBasket()
            ));
          },
            icon: Icon(Icons.shopping_basket, color: Colors.black45,),
          )
        ],
      ),
      body: GoogleMap(
        onMapCreated: onComplete,
        markers: _branchesList,
        initialCameraPosition: CameraPosition(
          target: LatLng(32.733901, 53.300847),
          zoom: 5,
        ),
      ),
    );
  }

  void fetchPoints() async {
    var url = "http://welearnacademy.ir/flutter/branches.json";
    Response response = await get(Uri.parse(url));
    setState(() {
      var pointsJson = json.decode(utf8.decode(response.bodyBytes));
      for (var point in pointsJson) {
        var b = Branch(
            point['shop_name'], point['id'], point['tel'], point['lat'],
            point['lng'], point['manager']);
        Marker marker = Marker(
            markerId: MarkerId(b.id.toString()),
            position: LatLng(b.lat, b.lng),
            infoWindow: InfoWindow(
                title: b.shop_name,
                snippet: b.manager
            )
        );
        _branchesList.add(marker);
      }
    });
  }
}
