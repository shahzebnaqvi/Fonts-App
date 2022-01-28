import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fonts_project/favourite.dart';
import 'package:fonts_project/favouritedatapage.dart';
import 'package:fonts_project/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'home_main.dart';
import 'loader.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Free Font",
            style: GoogleFonts.lato(),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favourite()),
                  );
                },
                child: Icon(Icons.favorite_outline)),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Searchpage()),
                  );
                },
                child: Icon(Icons.search)),
          ],
        ),
        body: HomePage());
  }
}
