import "package:flutter/material.dart";
import 'dart:math';

class ColorLoader3 extends StatefulWidget {
  final double radius;
  final double dotRadius;

  ColorLoader3({this.radius = 30.0, this.dotRadius = 3.0});

  @override
  _ColorLoader3State createState() => _ColorLoader3State();
}

class _ColorLoader3State extends State<ColorLoader3>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_rotation;
  late Animation<double> animation_rotation1;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;
  late AnimationController controller;
  late AnimationController _controller;
  late double radius;
  late double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    print(dotRadius);

    controller = AnimationController(
        // lowerBound: 0.0,
        // upperBound: 1.0,
        duration: const Duration(seconds: 2),
        vsync: this);


    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    animation_rotation1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeInCirc),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animation_radius_in.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25)
          radius = widget.radius * animation_radius_out.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.stop(canceled: true);
      }
    });

    controller.repeat( );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.purple.shade600,
        borderRadius: BorderRadius.circular(50),
      ),
      child:  Center(
        child:  Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),

          child:  Center(
            child: Stack(
              children: <Widget>[
                RotationTransition(
                  turns:Tween(begin: 0.0, end: 0.85).animate(
                    CurvedAnimation(
                    parent: controller,
                      curve: Interval(0.08, 1.0, curve: Curves.linear),
                  ),
                  ),
                  child:
                  Transform.translate(
                   child: Dot(
                     title: "L",
                     radius: 20,
                     // color: Colors.deepOrangeAccent,
                   ),
                   offset: Offset(
                     radius * cos(0.0+3  * pi /2.7),
                     radius * sin(0.0+3* pi / 2.5),
                   ),
                  ),
                ),
                RotationTransition(
                  turns:Tween(begin: 0.0, end: 0.9).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.06, 1.0, curve: Curves.linear),
                    ),),
                  child:
                  Transform.translate(
                    child:
                    Dot(
                      title: "O",
                      radius: 20,
                      // color: Colors.deepOrangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0+4.2 * pi / 3),
                      radius * sin(0.0+4.2  * pi / 3),
                    ),
                  ),
                ),
                RotationTransition(
                  turns:Tween(begin: 0.0, end: 0.97).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.04, 1.0, curve: Curves.linear),
                    ),),
                  child:
                  Transform.translate(
                    child: Dot(
                      title: "A",
                      radius: 20,
                      // color: Colors.deepOrangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 +5.5 * pi / 3.4),
                      radius * sin(0.0+5.5  * pi / 3.4),
                    ),
                  ),
                ),
                RotationTransition(
                  turns:Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.0, 0.95, curve: Curves.linear),
                    ),),
                  child:
                  Transform.translate(
                    child: Dot(
                      title: "D",
                      radius: 20,
                      // color: Colors.deepOrangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 +6.3 * pi / 3.4),
                      radius * sin(0.0+6.3  * pi / 3.4),
                    ),
                  ),
                ),

                RotationTransition(
                  turns:Tween(begin: 0.0, end: 0.97).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.04, 1.0, curve: Curves.linear),
                    ),),
                  child:
                  Transform.translate(
                    child: Dot(
                      title: "I",
                      radius: 20,
                      // color: Colors.deepOrangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 +7.6 * pi / 3.4),
                      radius * sin(0.0+7.6  * pi / 3.4),
                    ),
                  ),
                ),
                RotationTransition(
                  turns:Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.0, 0.95, curve: Curves.linear),
                    ),),
                  child:
                  Transform.translate(
                    child: Dot(
                      title: "N",
                      radius: 20,
                      // color: Colors.deepOrangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 +8.3 * pi / 3.4),
                      radius * sin(0.0+8.3  * pi / 3.4),
                    ),
                  ),
                ),
                RotationTransition(
                  turns:Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.0, 0.95, curve: Curves.linear),
                    ),),
                  child:
                  Transform.translate(
                    child: Dot(
                      title: "G",
                      radius: 20,
                      // color: Colors.deepOrangeAccent,
                    ),
                    offset: Offset(
                      radius * cos(0.0 +9.1 * pi / 3.4),
                      radius * sin(0.0+9.1  * pi / 3.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;
     String  title;
  Dot({this.radius, this.color,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration( shape: BoxShape.circle),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),

      ),
    );
  }
}