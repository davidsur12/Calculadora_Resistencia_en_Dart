//import 'dart:ffi';

import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navegacion/pages/page2.dart';
import "dart:async" show Future;
import "package:flutter/services.dart" show rootBundle;
import "resistor/bloc/resistor_bloc.dart";

void main() {
  runApp(const MyAPP());
}


class MyAPP extends StatelessWidget{
 const MyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   

   return MultiBlocProvider(
    providers: [ 
      BlocProvider(create: ( _ ) => ResistorBloc())
    ],
    child: PageOne(),
    );
  }



}
