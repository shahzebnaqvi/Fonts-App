import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
class PreviewScreen extends StatefulWidget {
  final fontname;
  final fontlogo;
  final fontauthor;
  final topcat;
  final subcat;
  PreviewScreen(this.fontlogo, this.fontname,this.fontauthor,this.topcat,this.subcat);


  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: BannerAd(),
      ),
      appBar: AppBar(
        title: Text(
          "Preview Screen",
          style: GoogleFonts.lato(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("Image Preview",style: TextStyle(color: Colors.purple,fontSize: 25),)),
          SizedBox(height: 20,),
          //image
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            padding: EdgeInsetsDirectional.all(10),
            height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.network("${widget.fontlogo}",fit: BoxFit.fill,)),
          SizedBox(height: 30,),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("Font Details",style: TextStyle(color: Colors.purple,fontSize: 25),)),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            height: 200,
            width: widthSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                //font auther
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10,top: 10),
                        child: const Text("Author Name",style: TextStyle(color: Colors.purple,fontSize: 20),)),
                    Container(
                      margin: EdgeInsets.only(right: 10,top: 10),
                        child: Text("${widget.fontauthor}",style: TextStyle(color: Colors.purple,fontSize: 20),))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10,top: 10),
                        child: const Text("Font Name",style: TextStyle(color: Colors.purple,fontSize: 20),)),
                    Container(
                        margin: EdgeInsets.only(right: 10,top: 10),
                        child: Text("${widget.fontname}",style: TextStyle(color: Colors.purple,fontSize: 20),))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10,top: 10),
                        child: const Text("Top Cat",style: TextStyle(color: Colors.purple,fontSize: 20),)),
                    Container(
                        margin: EdgeInsets.only(right: 10,top: 10),
                        child: Text("${widget.topcat}",style: TextStyle(color: Colors.purple,fontSize: 20),))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10,top: 10),
                        child: const Text("Sub Cat",style: TextStyle(color: Colors.purple,fontSize: 20),)),
                    Container(
                        margin: EdgeInsets.only(right: 10,top: 10),
                        child: Text("${widget.subcat}",style: TextStyle(color: Colors.purple,fontSize: 20),))
                  ],
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
