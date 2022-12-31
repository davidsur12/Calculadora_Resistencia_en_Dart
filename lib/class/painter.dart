import "package:flutter/material.dart";
class MyPainter extends CustomPainter {

  Color Banda1=Colors.red;
   Color Banda2=Colors.red;
   Color Banda3=Colors.black;
   Color Banda4=Colors.white;
   Color color = Color.fromRGBO(156, 39, 176, 1);

 MyPainter._privateConstructor();
  static final MyPainter instance = MyPainter._privateConstructor();

   MyPainter(this.Banda1, this.Banda2, this.Banda3, this.Banda4 ) ;

  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    //var paint = Paint()..color = Colors.black;
    var paint = [
      /*
      Paint()..color = Colors.white,
      Paint()..color = Colors.red,
      Paint()..color = Colors.green,
      Paint()..color = Colors.purple
      */
      Paint()..color = Banda1,
      Paint()..color = Banda2,
      Paint()..color = Banda3,
      Paint()..color = Banda4,
    ]; 
    Rect myRect1 = const Offset(70, 22) & const Size(20.0, 76.0);

    List<Rect> myRect = [
      const Offset(80, 22) & const Size(20.0, 76.0),
      const Offset(130, 28) & const Size(20.0, 64.0),
      const Offset(220, 28) & const Size(20.0, 64.0),
      const Offset(300, 22) & const Size(20.0, 76.0)
    ];

    //canvas.drawLine(Offset(0, 0), Offset(center.width, center.height) , paint);
    canvas.drawRect(myRect[0], paint[0]);
    canvas.drawRect(myRect[1], paint[1]);
    canvas.drawRect(myRect[2], paint[2]);
    canvas.drawRect(myRect[3], paint[3]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}