import 'dart:async';
import 'package:eight_queens/models/feedback.dart';
import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/utils/constants.dart';
import 'package:eight_queens/utils/queens_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'queens_event.dart';
part 'queens_state.dart';
part 'queens_bloc.freezed.dart';

class QueensBloc extends Bloc<QueensEvent, QueensState> {
  final QueensHandler queensHandler = QueensHandler();

  QueensBloc() : super(QueensState.initial()) {
    on<OnCellSelected>(_onCellSelected);
    on<OnStartPressed>(_onStartPresses);
    on<OnDragApplied>(_onDragApplied);
  }

  FutureOr<void> _onStartPresses(
      OnStartPressed event, Emitter<QueensState> emit) {
    emit(state.copyWith(
      selectedSolution: [],
      isSolved: false,
      count: 0,
    ));
  }

  FutureOr<void> _onCellSelected(
    OnCellSelected event,
    Emitter<QueensState> emit,
  ) {
    _upsertQueen(event, emit);
    _checkPlacement(emit);
  }

  void _upsertQueen(OnCellSelected event, Emitter<QueensState> emit) {
    if (queensHandler.containsPosition(state.selectedSolution, event.queen)) {
      final updatedList = List.of(state.selectedSolution)
        ..removeWhere((element) =>
            element.row == event.queen.row && element.col == event.queen.col);

      emit(state.copyWith(
          selectedSolution: updatedList, isPlacementValid: null));
    } else if (state.selectedSolution.length < numberOfQueens) {
      final updatedList = List.of(state.selectedSolution)..add(event.queen);
      emit(state.copyWith(
          selectedSolution: updatedList, isPlacementValid: null));
    }
  }

  void _checkPlacement(Emitter<QueensState> emit) {
    if (state.selectedSolution.length > 1) {
      PlacementFeedback placementFeedback =
          queensHandler.isValidSolution(state.selectedSolution);
      emit(state.copyWith(
        selectedSolution: state.selectedSolution,
        isPlacementValid: placementFeedback.type == PlacementFeedbackType.VALID,
        isSolved: placementFeedback.type == PlacementFeedbackType.VALID &&
            state.selectedSolution.length == numberOfQueens,
        invalidFeedback: placementFeedback.type != PlacementFeedbackType.VALID
            ? placementFeedback
            : null,
      ));
    }
  }

  FutureOr<void> _onDragApplied(
      OnDragApplied event, Emitter<QueensState> emit) {
    final previous = event.previous;
    final current = event.current;

    final updatedList = List.of(state.selectedSolution)
      ..removeWhere((element) {
        return element.row == previous.row && element.col == previous.col;
      })
      ..add(current);
    emit(state.copyWith(
      selectedSolution: updatedList,
      isPlacementValid: null,
    ));

    _checkPlacement(emit);
  }
}
