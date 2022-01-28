import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class NativeAds extends StatefulWidget {
  const NativeAds({Key? key}) : super(key: key);

  @override
  _NativeAdsState createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds>
    with AutomaticKeepAliveClientMixin {
  Widget? child;

  final controller = NativeAdController();

  @override
  void initState() {
    super.initState();
    controller.onEvent.listen((event) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (child != null) return child!;
    return RefreshIndicator(
        onRefresh: () async {
          setState(() => child = SizedBox());
          // await controller.load(force: true);
          await Future.delayed(Duration(milliseconds: 20));
          setState(() => child = null);
        },
        child: NativeAd(
          height: 320,
          unitId: MobileAds.nativeAdUnitId,
          buildLayout: mediumAdTemplateLayoutBuilder,
          // buildLayout: fullBuilder,
          loading: SizedBox(),
          error: Text('error'),
          // icon: AdImageView(size: 40),
          // headline: AdTextView(
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          //   maxLines: 1,
          // ),
          // body: AdTextView(style: TextStyle(color: Colors.black), maxLines: 1),
          // media: AdMediaView(
          //   height: 170,
          //   width: MATCH_PARENT,
          // ),
          // attribution: AdTextView(
          //   width: WRAP_CONTENT,
          //   text: 'Ad',
          //   decoration: AdDecoration(
          //     border: BorderSide(color: Colors.green, width: 2),
          //     borderRadius: AdBorderRadius.all(16.0),
          //   ),
          //   style: TextStyle(color: Colors.green),
          //   padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
          // ),
          // button: AdButtonView(
          //   elevation: 18,
          //   decoration: AdDecoration(backgroundColor: Colors.blue),
          //   height: MATCH_PARENT,
          //   textStyle: TextStyle(color: Colors.white),
          // ),
          // ratingBar: AdRatingBarView(starsColor: Colors.white),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
