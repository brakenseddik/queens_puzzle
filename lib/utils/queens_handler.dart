import 'package:eight_queens/models/placement_feedback.dart';
import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/utils/constants.dart';

/// The QueensHandler class is responsible for solving and validating the Eight Queens Puzzle
/// It contains methods to solve the puzzle [solveNQueens] to help user understand the puzzle
/// and validate the solution [isValidSolution] to check if the queens are not attacking each other
class QueensHandler {
  List<List<int>> solveNQueens() {
    List<List<int>> solutions = [];
    List<int> board = List.filled(numberOfQueens, -1);
    _solve(0, board, solutions, numberOfQueens);
    return solutions;
  }

  void _solve(int row, List<int> board, List<List<int>> solutions, int n) {
    if (row == n) {
      solutions.add(List.from(board));
      return;
    }

    for (int col = 0; col < n; col++) {
      if (_canPlaceQueen(board, row, col, n)) {
        board[row] = col;
        _solve(row + 1, board, solutions, n);
        board[row] = -1;
      }
    }
  }

  bool _canPlaceQueen(List<int> board, int row, int col, int n) {
    for (int i = 0; i < row; i++) {
      if (board[i] == col ||
          board[i] - i == col - row ||
          board[i] + i == col + row) {
        return false;
      }
    }
    return true;
  }

  /// Get the positions of the queens on the chess board
  /// It accepts a list of integers representing the column positions of the queens
  /// and returns a list of [QueenModel] objects
  List<QueenModel> getChessBoardPositions(List<int> solution) {
    List<QueenModel> positions = [];

    for (int row = 0; row < solution.length; row++) {
      positions.add(QueenModel(row: row, col: solution[row]));
    }

    return positions;
  }

  /// Validate the solution by checking if the queens are not attacking each other
  /// The solution is valid if no two queens are in the same row, column, or diagonal
  /// IT accepts a list of [QueenModel] objects and returns a [PlacementFeedback]
  PlacementFeedback isValidSolution(List<QueenModel> solution) {
    for (int i = 0; i < solution.length; i++) {
      for (int j = i + 1; j < solution.length; j++) {
        if (solution[i].row == solution[j].row) {
          return PlacementFeedback(
              type: PlacementFeedbackType.SAME_ROW,
              queen1: solution[i],
              queen2: solution[j]);
        } else if (solution[i].col == solution[j].col) {
          return PlacementFeedback(
              type: PlacementFeedbackType.SAME_COLUMN,
              queen1: solution[i],
              queen2: solution[j]);
        } else if (solution[i].row - solution[i].col ==
            solution[j].row - solution[j].col) {
          return PlacementFeedback(
              type: PlacementFeedbackType.SAME_DIAGONAL,
              queen1: solution[i],
              queen2: solution[j]);
        } else if (solution[i].row + solution[i].col ==
            solution[j].row + solution[j].col) {
          return PlacementFeedback(
              type: PlacementFeedbackType.SAME_DIAGONAL,
              queen1: solution[i],
              queen2: solution[j]);
        }
      }
    }
    return PlacementFeedback(
        type: PlacementFeedbackType.VALID,
        queen1: QueenModel(row: -1, col: -1),
        queen2: QueenModel(row: -1, col: -1));
  }
}
