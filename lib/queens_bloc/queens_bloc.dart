import 'dart:async';
import 'dart:math';
import 'package:eight_queens/models/placement_feedback.dart';
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
    on<OnSolvePressed>(_onSolvePressed);
    on<OnResetPressed>(_onResetPressed);
  }

  FutureOr<void> _onStartPresses(
      OnStartPressed event, Emitter<QueensState> emit) {
    final randomIndex = Random().nextInt((numberOfQueens * numberOfQueens) - 1);
    final queen = QueenModel(
      row: randomIndex ~/ numberOfQueens,
      col: randomIndex % numberOfQueens,
    );
    emit(state.copyWith(
      selectedSolution: [queen],
      isSolved: false,
      isPlacementValid: null,
      solutionCounter: 0,
      invalidFeedback: null,
      randomQueen: queen,
    ));
  }

  FutureOr<void> _onCellSelected(
      OnCellSelected event, Emitter<QueensState> emit) {
    _upsertQueen(event, emit);
    _checkPlacement(emit);
  }

  /// This function is used to add or remove a queen from the selectedSolution list
  /// The max number of queens that can be placed is equal to the [numberOfQueens]
  void _upsertQueen(OnCellSelected event, Emitter<QueensState> emit) {
    final existingQueenIndex = state.selectedSolution.indexWhere((element) =>
        element.row == event.queen.row && element.col == event.queen.col);

    List<QueenModel> updatedList = List.of(state.selectedSolution);

    if (existingQueenIndex != -1) {
      // If the queen already exists, remove it
      updatedList.removeAt(existingQueenIndex);
    } else if (updatedList.length < numberOfQueens) {
      // If the queen doesn't exist and the maximum number is not reached, add it
      updatedList.add(event.queen);
    }

    emit(state.copyWith(
      selectedSolution: updatedList,
      isPlacementValid: null,
    ));
  }

  /// This function is used to check if the queens are placed correctly
  /// It updates the state with the feedback of the placement on the chess board
  void _checkPlacement(Emitter<QueensState> emit) {
    if (state.selectedSolution.length > 1) {
      final res = queensHandler.isValidSolution(state.selectedSolution);
      final isSolved =
          res.isRight() && state.selectedSolution.length == numberOfQueens;

      emit(state.copyWith(
        selectedSolution: state.selectedSolution,
        isPlacementValid: res.isRight(),
        isSolved: isSolved,
        invalidFeedback: res.fold((feedback) => feedback, (unit) => null),
      ));
    }
  }

  FutureOr<void> _onDragApplied(
      OnDragApplied event, Emitter<QueensState> emit) {
    final previous = event.previous; // previous position
    final current = event.current; // current position
    /// Remove the previous queen and add the current queen
    /// we do that because the drag and drop actually makes a copy
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

  /// This function is used to provide solutions for the N-Queens problem
  /// It updates the state with the selected solution
  /// It gives the user a solution if the user could not solve the puzzle
  FutureOr<void> _onSolvePressed(
      OnSolvePressed event, Emitter<QueensState> emit) {
    // generate a solution based on the current counter value
    // convert the solution to a list of QueenModel objects
    final res = queensHandler.getChessBoardPositions(
        queensHandler.solveNQueens()[state.solutionCounter]);
    if (state.solutionCounter == queensHandler.solveNQueens().length - 1) {
      emit(state.copyWith(
        selectedSolution: res,
        isSolved: true,
        solutionCounter: 0,
        isPlacementValid: true,
      ));
    } else {
      final count = state.solutionCounter + 1;
      emit(state.copyWith(
        selectedSolution: res,
        isSolved: true,
        isPlacementValid: true,
        solutionCounter: count,
      ));
    }
  }

  /// This function is used to reset the state of the game
  FutureOr<void> _onResetPressed(
      OnResetPressed event, Emitter<QueensState> emit) {
    emit(QueensState.initial());
  }
}
