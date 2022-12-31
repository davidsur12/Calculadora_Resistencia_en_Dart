import "dart:async";
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'resistor_event.dart';
part 'resistor_state.dart';

class ResistorBloc extends Bloc<ResistorEvent, ResistorState> {
  ResistorBloc() : super(ResistorState()) {
    //on<ResistorEvent>((event, emit) => emit);
    on<cambioColor>(_cambioColor);
    //  on<evento>(_eveto1);
  }
  void _cambioColor(event, emit) {
    Color color = event.Banda1;
    emit(
      state.copyWith(
          //  num: state.num + n,
          Banda1: event.Banda1,
          Banda2: event.Banda2,
          Banda3: event.Banda3,
          Banda4: event.Banda4),
    );
  }

/*
  @override
  Stream<ResistorState> mapEventToState(
    ResistorEvent event,
  ) async* {
    if (event is cambioColor) {
      yield ResistorState(
        Banda1: Colors.black,
        Banda2: Colors.black,
        Banda3: Colors.black,
        Banda4: Colors.black,
      );
    } else if (event is cambioColor2) {
      yield ResistorState(
        Banda1: Colors.white,
        Banda2: Colors.white,
        Banda3: Colors.white,
        Banda4: Colors.white,
      );
    }
  }
  */
}
