import 'package:eight_queens/models/placement_feedback.dart';
import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/utils/queens_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final handler = QueensHandler();
  group('isValidSolution test', () {
    test('should return PlacementFeedbackType.VALID when solution is valid',
        () {
      final solution =
          handler.getChessBoardPositions(handler.solveNQueens().first);
      final result = handler.isValidSolution(solution);
      expect(result.type, PlacementFeedbackType.VALID);
    });

    test(
        'should return PlacementFeedbackType.SAME_ROW when 2 or three queens are on same row',
        () {
      final solution =
          List.generate(8, (index) => QueenModel(row: 0, col: index));
      final result = handler.isValidSolution(solution);
      expect(result.type, PlacementFeedbackType.SAME_ROW);
    });

    test(
        'should return PlacementFeedbackType.SAME_COLUMN when 2 or three queens are on same column',
        () {
      final solution =
          List.generate(8, (index) => QueenModel(row: index, col: 0));
      final result = handler.isValidSolution(solution);
      expect(result.type, PlacementFeedbackType.SAME_COLUMN);
    });

    test(
        'should return PlacementFeedbackType.SAME_DIAGONAL when 2 or three queens are on same diagonal',
        () {
      final solution =
          List.generate(8, (index) => QueenModel(row: index, col: index));
      final result = handler.isValidSolution(solution);
      expect(result.type, PlacementFeedbackType.SAME_DIAGONAL);
    });
  });
}
