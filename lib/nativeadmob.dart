import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';


 String get appId {

  if (Platform.isAndroid) {
    return "ca-app-pub-3940256099942544~3347511713";
  }  else {
    throw new UnsupportedError("Unsupported platform");
  }
}


String get nativeAdUnitId {
  /// Always test with test ads
  if (kDebugMode){
    return MobileAds.nativeAdTestUnitId;
  }
  else if (Platform.isIOS){
    return 'your id will be here';
  }

  else if (Platform.isAndroid){
    return 'ca-app-pub-7705274457914321/9754038302';
  }
  return "";
}

String get bannerAdUnitId {
  /// Always test with test ads
  if (kDebugMode){
    return MobileAds.bannerAdTestUnitId;
  }
  else if (Platform.isIOS){
    return 'your id will be here';
  }

  else if (Platform.isAndroid){
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return "";
}

String get interstitialAdUnitId {
  /// Always test with test ads
  if (kDebugMode){
    return MobileAds.interstitialAdTestUnitId;
  }
  else if (Platform.isIOS){
    return 'your id will be here ';
  }

  else if (Platform.isAndroid){
    return 'ca-app-pub-3940256099942544/1033173712';
  }
  return "";
}

String get rewardedAdUnitId {
  /// Always test with test ads
  if (kDebugMode)
    return MobileAds.rewardedAdTestUnitId;
  else return 'you-interstitial-ad-unit-id';
}

// String get appOpenAdUnitId {
//   /// Always test with test ads
//   if (kDebugMode){
//     return MobileAds.bannerAdTestUnitId;
//   }
//   else if (Platform.isIOS){
//     return 'ca-app-pub-7705274457914321/1597862670';
//   }
//
//   else if (Platform.isAndroid){
//     return 'ca-app-pub-7705274457914321/6666418222';
//   }
// }

