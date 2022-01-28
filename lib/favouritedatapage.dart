import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fonts_project/preview_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'native_add_view.dart';
import 'nativeadmob.dart';
import 'home_main.dart';

final interstitialAd = InterstitialAd()..load(unitId: interstitialAdUnitId);
bool isLoading = false;
bool downloading = false;
String progress = '0';
bool isDownloaded = false;
// final adata = GetStorage();

// var favouritelst2 = favouritelst.split(",");

class Favouritedatapage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FavouritedatapageState();
}

class FavouritedatapageState extends State<Favouritedatapage> {
  static int page = 0;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  bool downloading = false;
  String progress = '0';
  bool isDownloaded = false;

  final dio = new Dio();
  Future<void> _download(font, image, imagename) async {
    final response = await http.get(Uri.parse('${font}'));
    // final response_image = await http.get(Uri.parse('${image}'));
    // Get the image name
    print("font url ${font}");
    final fontName = imagename + ".zip";
    // final imageName = path.basename(image);
    final appDir = Directory('/storage/emulated/0/Download');
    // print("image name ${fontName} base name ${imageName}");
    final localPath = path.join(appDir.path, "fontsapp");

    final font_path = path.join(localPath, fontName);
    final path_ = Directory(localPath);
    if (await path_.exists()) {
      final fontFile = File(font_path);
      await fontFile.writeAsBytes(response.bodyBytes);
    } else {
      path_.create();
      // final imageFile = File(image_path);
      final fontFile = File(font_path);
      // await imageFile.writeAsBytes(response_image.bodyBytes);
      await fontFile.writeAsBytes(response.bodyBytes);
    }
  }

  List favourite = [];
  Future<void> downloadFile(uri, fileName) async {
    setState(() {
      downloading = true;
    });

    var savePath = (await getFilePath(fileName));
    Dio dio = Dio();
    if (await savePath.exists()) {
      dio.download(
        uri,
        savePath,
        onReceiveProgress: (rcv, total) {
          print(
              'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

          setState(() {
            progress = ((rcv / total) * 100).toStringAsFixed(0);
          });

          if (progress == '100') {
            setState(() {
              isDownloaded = true;
            });
          } else if (double.parse(progress) < 100) {}
        },
        deleteOnError: true,
      ).then((_) {
        setState(() {
          if (progress == '100') {
            print("savedpath${savePath}");
            isDownloaded = true;
          }

          downloading = false;
        });
      });
    } else {
      savePath.create();
      dio.download(
        uri,
        savePath,
        onReceiveProgress: (rcv, total) {
          print(
              'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

          setState(() {
            progress = ((rcv / total) * 100).toStringAsFixed(0);
          });

          if (progress == '100') {
            setState(() {
              isDownloaded = true;
            });
          } else if (double.parse(progress) < 100) {}
        },
        deleteOnError: true,
      ).then((_) {
        setState(() {
          if (progress == '100') {
            print("savedpath${savePath}");
            isDownloaded = true;
          }

          downloading = false;
        });
      });
    }
  }

  Future<Directory> getFilePath(uniqueFileName) async {
    Directory dir =
        await Directory('/storage/emulated/0/Download').create(recursive: true);
    final localPath = path.join(dir.path, uniqueFileName);

    final path_ = Directory(localPath);
    return path_;
  }

  Future<void> ad() async {
    await interstitialAd.show();
  }

  bool _isFavorited = true;
  List storageList = [];

  @override
  void initState() {
    super.initState();
    _sc.addListener(() {});
    setState(() {
      favouritelst = adata.getKeys().toString();
      favouritelst2 = favouritelst
          .replaceAll("(", "")
          .replaceAll(")", "")
          .replaceAll(", ", ",")
          .replaceAll(" ,", ",")
          .split(",");
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildList() {
    final controller = NativeAdController();
    return ListView.separated(
      itemCount: users.length + 1, // Add one more item for progress indicator
      padding: EdgeInsets.symmetric(vertical: 8.0),
      separatorBuilder: (context, i) {
        return const SizedBox();
      },
      itemBuilder: (BuildContext context, int index) {
        if (index == users.length) {
          return _buildProgressIndicator();
        } else {
          var isfav = box.read(users[index]["font_name"]) ?? false;
          print("isfav     ${isfav}");
          print(users[index]["font_logo"]);
          if (favouritelst2.contains("${users[index]["font_name"]}")) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.purple.shade600,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () async {
                          if (isfav) {
                            await box.remove('${users[index]["font_name"]}');
                          } else {
                            await box.write(
                                '${users[index]["font_name"]}', true);
                          }
                          setState(() {
                            favouritelst = adata.getKeys().toString();
                            favouritelst2 = favouritelst
                                .replaceAll("(", "")
                                .replaceAll(")", "")
                                .replaceAll(", ", ",")
                                .replaceAll(" ,", ",")
                                .split(",");
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.red, width: 2)),
                          child: Center(
                              child: !isfav
                                  ? Icon(Icons.favorite_border, size: 20)
                                  : Icon(Icons.favorite, size: 20)),
                        ),
                      ),
                    ),
                    // CachedNetworkImage(
                    //   imageUrl: users[index]["font_logo"],
                    //   placeholder: (context, url) => CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                    Image.network(users[index]["font_logo"]),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // height: 50,
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PreviewScreen(
                                        users[index]["font_logo"],
                                        users[index]["font_name"],
                                        users[index]["font_auther"],
                                        users[index]["top_cat"],
                                        users[index]["sub_cat"])),
                              );
                            },
                            child: const Text(
                              'Preview Font',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () async {
                              var status = await Permission.storage.request();
                              if (status.isGranted) {
                                // await downloadFile(users[index]["download_link"], users[index]["font_name"]);
                                await _download(
                                    users[index]["download_link"],
                                    users[index]["font_logo"],
                                    users[index]["font_name"]);
                                if (!interstitialAd.isLoaded)
                                  interstitialAd.load();
                                else {
                                  ad();
                                }
                                interstitialAd.onEvent.listen((e) {
                                  final event = e.keys.first;
                                  switch (event) {
                                    case FullScreenAdEvent.closed:
                                      // Here is a handy place to load a new interstitial after displaying the previous one
                                      interstitialAd.load();
                                      // Do not show an ad here
                                      break;
                                    default:
                                      break;
                                  }
                                });
                                await ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text('Download Complete'),
                                  ),
                                );
                              }
                              if (await Permission.storage.isLimited) {}
                            },
                            child: const Text(
                              'Download Font',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox(
              width: 0.0,
              height: 0.0,
            );
          }
        }
      },
      controller: _sc,
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Container(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: CircularProgressIndicator(
            color: Colors.purple.shade600,
          ),
        ),
      ),
    );
  }
}
