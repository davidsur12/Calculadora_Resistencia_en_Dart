part of 'resistor_bloc.dart';

class ResistorState extends Equatable {
  final Color Banda1;
  final Color Banda2;
  final Color Banda3;
  final Color Banda4;

  //ResistorState((this.Banda1, this.Banda2, this.Banda3, this.Banda4));
  ResistorState({
    this.Banda1 = Colors.red,
    this.Banda2 = Colors.red,
    this.Banda3 = Colors.black,
    this.Banda4 = Colors.white,
  });
  ResistorState copyWith({
    Color? Banda1,
    Color? Banda2,
    Color? Banda3,
    Color? Banda4,
  }) {
    return ResistorState(
      Banda1: Banda1 ?? this.Banda1,
      Banda2: Banda2 ?? this.Banda2,
      Banda3: Banda3 ?? this.Banda3,
      Banda4: Banda4 ?? this.Banda4,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [Banda1 , Banda2 , Banda3 , Banda4];
}

//class ResistorInitial extends ResistorState {}

