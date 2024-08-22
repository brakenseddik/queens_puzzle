import 'package:eight_queens/models/feedback.dart';
import 'package:eight_queens/models/queen_model.dart';
import 'package:flutter/material.dart';

class QueensHandler {
  static int n = 8;
  List<List<int>> solveNQueens() {
    List<List<int>> solutions = [];
    List<int> board = List.filled(n, -1);
    _solve(0, board, solutions, n);
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

  // Covert a 1D array solution to a 2D array to place them easily on the board.
  List<QueenModel> getChessBoardPositions(List<int> solution) {
    List<QueenModel> positions = [];

    for (int row = 0; row < solution.length; row++) {
      positions.add(QueenModel(row: row, col: solution[row]));
    }

    return positions;
  }

  /// Checks if a given target is in the list of positions
  // It checks which cells represent the positions of the queens
  bool containsPosition(List<QueenModel> positions, QueenModel target) {
    for (final position in positions) {
      if (position.row == target.row && position.col == target.col) {
        return true;
      }
    }
    return false;
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
