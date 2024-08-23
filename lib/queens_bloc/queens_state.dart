part of 'queens_bloc.dart';

@freezed
class QueensState with _$QueensState {
  const factory QueensState({
    required List<QueenModel> selectedSolution,
    required bool isSolved,
    required int solutionCounter,
    required bool? isPlacementValid,
    required PlacementFeedback? invalidFeedback,
    required QueenModel? randomQueen,
  }) = _QueensState;

  factory QueensState.initial() => const QueensState(
        selectedSolution: [],
        isSolved: false,
        solutionCounter: 0,
        isPlacementValid: null,
        invalidFeedback: null,
        randomQueen: null,
      );
}
