part of 'resistor_bloc.dart';

@immutable
abstract class ResistorEvent extends  Equatable {}


class cambioColor extends ResistorEvent{


  final Color Banda1;
  final Color Banda2;
  final Color Banda3;
  final Color Banda4;
  cambioColor( this.Banda1 ,this.Banda2 , this.Banda3 , this.Banda4);

  @override
  // TODO: implement props
  List<Object?> get props => [Banda1 , Banda2 , Banda3 , Banda4];



}
class cambioColor2 extends ResistorEvent{


  final Color Banda1;
  final Color Banda2;
  final Color Banda3;
  final Color Banda4;
  cambioColor2( this.Banda1 ,this.Banda2 , this.Banda3 , this.Banda4);

  @override
  // TODO: implement props
  List<Object?> get props => [Banda1 , Banda2 , Banda3 , Banda4];



}