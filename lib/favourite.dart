import 'package:flutter/material.dart';
import 'package:fonts_project/favouritedatapage.dart';
import 'package:get_storage/get_storage.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

// final adata = GetStorage();
// var favouritelst = adata.getKeys().toString();
// var favouritelst2 = favouritelst.split(",");
// var favouritelst2 = favouritelst
//     .replaceAll("(", "")
//     .replaceAll(")", "")
//     .replaceAll(", ", ",")
//     .replaceAll(" ,", ",")
//     .split(",");

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Favourite",
          ),
        ),
        body: Favouritedatapage(),
      ),
    );
  }
}
