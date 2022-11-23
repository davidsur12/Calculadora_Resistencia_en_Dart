//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:navegacion/pages/page2.dart';
import "dart:async" show Future;
import "package:flutter/services.dart" show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navegcion',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calculadora de Resistencia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          children: [image4(), fila(), text()],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget fila() {
    return Row(
      children: [btn("btn1"), btn("btn2"), btn("btn3"), btn("btn4")],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget btn(String txt) {
    return RaisedButton(
      onPressed: () => {
        // print(txt),
        // next()
        n(context, txt)
      },
      child: Text(txt),
    );
  }

  Widget text() {
    return Padding(
      padding: const EdgeInsets.all(200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("centrar",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple)),
        ],
      ),
    );
  }

  void next() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page2(),
        ));
  }

  void alert(BuildContext context) {
    /*
 showDialog(context: context, child: AlertDialog(title: Text("alert dialogo"), content: Text("esto es un dialogo" ,
 actions:[TextButton(onPressed: (){print("boton ok")}, child: Text("boton ok"))],
 ));

*/
  }
  void n(BuildContext context, String txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("alert dialogo"),
              content: Text("esto es un dialogo btn $txt"),
              actions: [
                TextButton(
                    onPressed: () {
                      print("boton ok");
                    },
                    child: Text("boton ok")),
                TextButton(
                    onPressed: () {
                      print("demmis");
                      Navigator.pop(context);
                    },
                    child: Text(
                      "regresar",
                      style: TextStyle(color: Colors.black54),
                    ))
              ]);
        });
  }

  Widget image2() {
    return SizedBox(
        height: 250.0,
        width: 250.0,
        child: Image.asset("assets/resistencia.png"));
  }

  Widget image() {
    return Ink.image(
      image: AssetImage('assets/resistencia.png'), height: 200, width: 200,
      fit: BoxFit.cover,
      //image:NetworkImage("https://es.wikipedia.org/wiki/Colombia#/media/Archivo:Flag_of_Colombia.svg"),
    );
  }

  Widget image3(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/resistencia.png"))));
  }

  Widget image4() {
//Image.asset("assets/resistencia2.png" , width:80 , height: 90,);
    return SizedBox(
        width: 400,
        height: 120,
        child: Container(

            //color: Colors.cyanAccent,
            child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/resistencia2.png",
              width: 400,
              height: 120,
            ),
            canva()
          ],
        )));
  }

  Widget canva() {
    CustomPainter p=MyPainter();
    p.shouldRepaint();
    return CustomPaint(
      //size: Size(100, 100),
      painter: p,
      
      // child: Image.asset("assets/resistencia2.png" , width:80 , height: 90,),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    //var paint = Paint()..color = Colors.black;
    var paint = [
      Paint()..color = Colors.black,
      Paint()..color = Colors.red,
      Paint()..color = Colors.green,
      Paint()..color = Colors.purple
    ]; // Paint()..color = Colors.black;
    Rect myRect1 = const Offset(70, 22) & const Size(20.0, 76.0);

     List<Rect> myRect =[const Offset(80, 22) & const Size(20.0, 76.0), 
     const Offset(130, 28) & const Size(20.0, 64.0),
     const Offset(220, 28) & const Size(20.0, 64.0),
     const Offset(300, 22) & const Size(20.0, 76.0)] ;

    //canvas.drawLine(Offset(0, 0), Offset(center.width, center.height) , paint);
    canvas.drawRect(myRect[0], paint[0]);
    canvas.drawRect(myRect[1], paint[1]);
    canvas.drawRect(myRect[2], paint[2]);
    canvas.drawRect(myRect[3], paint[3]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
