part of 'queens_bloc.dart';

@freezed
class QueensState with _$QueensState {
  const factory QueensState({
    required List<QueenModel> selectedSolution,
    required bool isSolved,
    required int count,
    required bool? isPlacementValid,
    required PlacementFeedback? invalidFeedback,
  }) = _QueensState;

  factory QueensState.initial() => const QueensState(
        selectedSolution: [],
        isSolved: false,
        count: 0,
        isPlacementValid: null,
        invalidFeedback: null,
      );
}
