import 'dart:io';

import 'package:fonts_project/favourite.dart';
import 'package:fonts_project/favouritedatapage.dart';
import 'package:fonts_project/home_main.dart';
import 'package:fonts_project/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

import 'home_page.dart';
import 'nativeadmob.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.initialize(
    nativeAdUnitId: nativeAdUnitId,
  );
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Free Font';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
