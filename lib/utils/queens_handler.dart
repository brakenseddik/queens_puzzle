import 'package:eight_queens/models/queen_model.dart';

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
  List<List<int>> getChessBoardPositions(List<int> solution) {
    List<List<int>> positions = [];

    for (int row = 0; row < solution.length; row++) {
      positions.add([row, solution[row]]);
    }

    return positions;
  }

  // check if a position (i,j) is included in the solution
  // It checks which cells represent the positions of the queens
  bool containsPosition(List<QueenModel> positions, QueenModel target) {
    for (var position in positions) {
      if (position.row == target.row && position.col == target.col) {
        return true;
      }
    }
    return false;
  }

  // validate if the queens position solve the puzzle
  bool isValidSolution(List<int> solution) {
    int n = solution.length;

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        // Check if two queens are in the same column
        if (solution[i] == solution[j]) {
          return false;
        }
        // Check if two queens are on the same diagonal
        if ((solution[i] - solution[j]).abs() == (i - j).abs()) {
          return false;
        }
      }
    }

    return true;
  }
}
