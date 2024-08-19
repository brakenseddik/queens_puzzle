import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'queens_event.dart';
part 'queens_state.dart';
part 'queens_bloc.freezed.dart';

class QueensBloc extends Bloc<QueensEvent, QueensState> {
  QueensBloc() : super(const QueensState.initial()) {
    on<QueensEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
