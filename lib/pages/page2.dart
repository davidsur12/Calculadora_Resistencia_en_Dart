import 'dart:math';

import "package:flutter/material.dart";
import 'package:navegacion/class/painter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navegacion/resistor/bloc/resistor_bloc.dart';


class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navegcion',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calculadora de Resistencia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color banda1 = Colors.red;
  Color banda2 = Colors.red;
  Color banda3 = Colors.black;
  Color banda4 = Colors.white;
  @override
  Widget build(BuildContext context) {
    // final bbb=BlocProvider.of<ResistorBloc>(context);

    Color c1 = Colors.black;
    Color c2 = Colors.lightBlue;
    String txt = "estes es un string";

    //var color = Colors.white;
    //MyPainter p = MyPainter(color, color, color, color);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column (children:[ SizedBox(height: 100 , width: 100) ,
          
          Row(
          children: [drop() , SizedBox(height: 70 , width: 70,), image4()  ], // origina
          mainAxisAlignment: MainAxisAlignment.center ,
        )
        
        ]
        
      ),
    )
    );
  }

  Widget fila() {
    //   final bbb=BlocProvider.of<ResistorBloc>(context);
    return Row(
      children: [
        btn("Banda 1", 1),
        btn("Banda 2", 2),
        btn("Banda 3", 3),
        btn("Banda 4", 4),
       
      
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget drop(){

return 

 Column(mainAxisAlignment:MainAxisAlignment.start , crossAxisAlignment: CrossAxisAlignment.start ,children: [
  Text("1.ª banda de color" ),
 Container(width: 200, child: lista2(1)),

 SizedBox(height: 30),
 Text("2.ª banda de color"),
 Container(width: 200, child: lista2(2)),
  SizedBox(height: 30),
 Text("3.ª banda de color"),
 Container(width: 200, child: lista2(3)),
  SizedBox(height: 30),
 Text("4.ª banda de color"), 
 Container(width: 200, child: lista2(4)),



 


]


);


  }


  

  Widget lista2(int id) {
    //https://www.flutterbeads.com/dropdown-or-dropdownbuttonformfield-border-in-flutter/
    var lista=["Negro" , "Cafe" ,"Rojo" , "Naranja" , "Amarillo" , "Verde" , "Azul" , "Violeta" , "Gris" , "Blanco"];
    String dropdownValue = 'Negro';
    return DropdownButtonFormField(
      
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        filled: true,
        fillColor: Colors.greenAccent,
      ),
      
      //dropdownColor: Colors.yellow,
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          //estadoLista(newValue , 1);
                estadoLista(newValue , id);
                

        });
      },
      items: <String>["Negro" , "Cafe" ,"Rojo" , "Naranja" , "Amarillo" , "Verde" , "Azul" , "Violeta" , "Gris" , "Blanco"].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value, 
          child: Text(value)// estadoLista(value),
        );
      }).toList(),
    );
  }

Widget estadoLista(String txt , int id ){
int n=-1;
int cont=0;
List<String> lista=["Negro" , "Cafe" ,"Rojo" , "Naranja" , "Amarillo" , "Verde" , "Azul" , "Violeta" , "Gris" , "Blanco"];

 // while(n == -1){
for(int i=0 ; i< 10 ; i++){ 
if(identical(lista[cont] , txt)){
n=cont;
print("item____________ " + n.toString());
break;

}
cont++;
  }
  
  
print("item_______ $txt _____ " + lista[n]);
Color color=Colors.white;
switch(n){

case 0:{color=Colors.black; }

break;

case 1:
{color=Color(0x7F3020);}
break;

case 2:
{color=Colors.red;}
break;

case 3:
{color=Colors.orange;}
break;

case 4:
{color=Colors.yellow;}
break;

case 5:
{color=Colors.green;}
break;

case 6:
{color=Colors.blue;}
break;

case 7:
{color=Colors.purple;}
break;

case 8:
{color=Colors.grey;}
break;

case 8:
{color=Colors.white;}
break;


}

switch(id){
case 1:

{banda1=color;}
break;

case 2:

{banda2=color;}
break;

case 3:

{banda3=color;}
break;

case 4:

{banda4=color;}
break;

}

print(banda1.toString() +  "    " + banda2.toString() +  "    " + banda3.toString() +  "    " + banda4.toString() +  "    ");

 context.read<ResistorBloc>().add(cambioColor(banda1 , banda2 , banda3 , banda4));
/*
 MyPainter p = MyPainter.instance;
 p.Banda1=banda1;
 p.Banda2=banda2;
 p.Banda3=banda3;
 p.Banda4=banda4;
 */
 print("____________________________________________________________________");
    //p.shouldRepaint(p);

  return Text(txt ,  style: TextStyle(fontSize: 20));

}

  Widget btn(String txt, int id) {
  
    return TextButton(
      onPressed: () => {
  
        context
            .read<ResistorBloc>()
            .add(cambioColor(banda1, banda2, banda3, banda4)),
      
      },
      child: Text(txt),
    );
  }

  void AlertDialogo(BuildContext context, String txt) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("alert dialogo"),
              content: Text("esto es un dialogo btn $txt"),
              actions: [
                TextButton(
                    onPressed: () {
                      canva(Colors.black, Colors.green, Colors.green,
                          Colors.green);
                      print("boton ok");
                      txt = "presiono el boton";
                    },
                    child: Text("boton ok")),
                TextButton(
                    onPressed: () {
                      canva(Colors.green, Colors.green, Colors.green,
                          Colors.green);

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

  Widget image4() {
  
    return SizedBox(
        width: 400,
        height: 120,
        child: Container(

     
            child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/resistencia2.png",
              width: 400,
              height: 120,
            ),
            // canva(Colors.green , Colors.green  , Colors.green , Colors.green )
            bandas()
          ],
        )));
  }

  Widget canva(Color Banda1, Color Banda2, Color Banda3, Color Banda4) {
    
    MyPainter p = MyPainter.instance;
   
   //MyPainter pp =   MyPainter(Banda1 , Banda2 , Banda3 , Banda4);
    p.Banda1 = Banda1;
    p.Banda2 = Banda2;
    p.Banda3 = Banda3;
    p.Banda4 = Banda4;
    

    p.shouldRepaint(p);

    return CustomPaint(
      
      painter: p,

      
    );
  }

  Widget bandas() {
    return BlocBuilder<ResistorBloc, ResistorState>(
      builder: (context, state) {
      
        print("Banda1 = " +
            state.Banda1.toString() +
            "\n  Banda2 = " +
            state.Banda2.toString() +
            "\n  Banda3 = " +
            state.Banda3.toString() +
            "\n  Banda4 = " +
            state.Banda4.toString());
        return canva(state.Banda1, state.Banda2, state.Banda3, state.Banda4);

      },
    );
  }
}



/*
  void next() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page2(),
        ));
  }
*/

/*
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
*/