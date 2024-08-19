import 'dart:developer';

import 'package:eight_queens/utils/constants.dart';
import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/utils/queens_handler.dart';
import 'package:eight_queens/widgets/cell_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

Widget feedback(List<DraggableGridItem> list, int index) {
  return SizedBox(width: 50, height: 50, child: list[index].child);
}

PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
  return PlaceHolderWidget(
    child: Container(
      color: Colors.white,
      child: const Icon(Icons.question_mark, color: Colors.deepPurple),
    ),
  );
}

class _PuzzlePageState extends State<PuzzlePage> {
  QueensHandler queensHandler = QueensHandler();

  int solutionsCount = 0;
  List<QueenModel> selectedSolution = [];
  bool isSolved = false;
  bool? isPlacementValid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: const Text(
            '👑 Eight Queens Puzzle 👑',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: DraggableGridViewBuilder(
                  physics: const NeverScrollableScrollPhysics(),
                  dragCompletion: onDragAccept,
                  isOnlyLongPress: false,
                  dragFeedback: feedback,
                  dragPlaceHolder: placeHolder,
                  children: buildListOfQueens(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                )),
            const Spacer(),
            ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  reset();
                },
                child: const Text(
                  'Start',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  displaySolutions();
                },
                child: Text(
                  'Display solution ${solutionsCount + 1}',
                  style: const TextStyle(color: Colors.white),
                )),
            const Spacer(),
          ],
        ));
  }

  List<DraggableGridItem> buildListOfQueens() {
    return List.generate(
      64,
      (index) {
        final row = index ~/ 8;
        final col = index % 8;
        final QueenModel queen = QueenModel(row: row, col: col);
        bool selected = queensHandler.containsPosition(selectedSolution, queen);
        return DraggableGridItem(
          isDraggable: true,
          dragCallback: (context, isDragging) {
            log('isDragging: $isDragging');
          },
          child: QueenCellWidget(
            row: row,
            col: col,
            selected: selected,
            isSolved: isSolved &&
                queensHandler.containsPosition(selectedSolution, queen),
            onTap: () => onCellSelected(queen),
          ),
        );
      },
    );
  }

  void onDragAccept(
      List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    log('onDragAccept: $beforeIndex -> $afterIndex');

    /// update the queen position to the new position
    /// remove the queen from the previous position
    if (beforeIndex != afterIndex) {
      selectedSolution.removeWhere((element) =>
          element.row == beforeIndex ~/ 8 && element.col == beforeIndex % 8);
      onCellSelected(QueenModel(row: afterIndex ~/ 8, col: afterIndex % 8));
    }
  }

  void reset() {
    setState(() {
      solutionsCount = 0;
      if (isSolved) {
        isSolved = false;
      }
      selectedSolution = [];
    });
  }

  void displaySolutions() {
    final res = queensHandler.getChessBoardPositions(
      queensHandler.solveNQueens()[solutionsCount],
    );
    setState(() {
      selectedSolution = [];
      for (List<int> element in res) {
        selectedSolution.add(QueenModel(row: element[0], col: element[1]));
      }
      isSolved = true;
    });

    /// Increment the counter to display the next solution
    /// In case of the last solution, reset the counter
    if (solutionsCount == queensHandler.solveNQueens().length - 1) {
      solutionsCount = 0;
    } else {
      solutionsCount++;
    }
  }

  void onCellSelected(QueenModel queen) {
    upsertQueen(queen);
    // Flatten the 2D list to a 1D list (row-wise positions)
    final sol = selectedSolution.map((element) => element.col).toList();

    checkIsValidPlacement(sol);
    // Check if the user solution is valid and has all 8 queens placed
    if (selectedSolution.length == 8) {
      bool isValid = queensHandler.isValidSolution(sol);
      setState(() {
        isSolved = isValid;
      });
      showResults();
    }
  }

  void checkIsValidPlacement(List<int> sol) {
    // For every position, check if it is in a valid position
    // This helps the user to get quick feedback when he places the queen in the wrong position
    if (selectedSolution.length > 1) {
      setState(() {
        isPlacementValid = queensHandler.isValidSolution(sol);
      });

      if (isPlacementValid == false) {
        Fluttertoast.showToast(
          msg: 'Invalid placement, please try again!',
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
  }

  void showResults() {
    if (isSolved) {
      Fluttertoast.showToast(
        msg: 'Congratulations 🎉🎊\n You solved the puzzle!!!',
        toastLength: Toast.LENGTH_LONG,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Invalid solution, please try again!',
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  void upsertQueen(QueenModel queen) {
    // Toggle the selection of the cell
    if (queensHandler.containsPosition(selectedSolution, queen)) {
      // Remove the existing position if it is already selected
      setState(() {
        log(' Remove called');
        selectedSolution.removeWhere(
          (element) => element.row == queen.row && element.col == queen.col,
        );
      });
    } else {
      if (selectedSolution.length < 8) {
        log(' Add called');
        setState(() {
          selectedSolution.add(queen);
          // Sort the solution by row index to keep the list ordered
          selectedSolution.sort((a, b) => a.row.compareTo(b.row));
        });
      }
    }

    final lg =
        selectedSolution.map((element) => [element.row, element.col]).toList();
    log('Selected solution: $lg');
  }
}
