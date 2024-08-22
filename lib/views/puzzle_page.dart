import 'package:eight_queens/main.dart';
import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:eight_queens/utils/constants.dart';
import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/utils/queens_handler.dart';
import 'package:eight_queens/views/cell_item.dart';
import 'package:eight_queens/views/draggable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  QueensHandler queensHandler = QueensHandler();

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
            BlocConsumer<QueensBloc, QueensState>(
              listener: (context, state) {
                if (state.selectedSolution.length == 8) {
                  showGameResult(state.isSolved);
                }
                if (state.isPlacementValid == false) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.deepPurpleAccent,
                    content: Text(
                      'Invalid placement: Queens at positions (${state.invalidFeedback!.queen1.row},${state.invalidFeedback!.queen1.col}) and (${state.invalidFeedback!.queen2.row},${state.invalidFeedback!.queen2.col}) can threaten each other',
                    ),
                    duration: const Duration(seconds: 3),
                  ));
                }
              },
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: DraggableGridViewBuilder(
                    physics: const NeverScrollableScrollPhysics(),
                    dragCompletion: onDragAccept,
                    isOnlyLongPress: false,
                    dragFeedback: feedback,
                    dragPlaceHolder: placeHolder,
                    children: buildListOfQueens(state),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
                style: buttonStyle,
                onPressed: () => context
                    .read<QueensBloc>()
                    .add(const QueensEvent.onStartPressed()),
                child: const Text(
                  'Start',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<QueensBloc, QueensState>(
              buildWhen: (previous, current) => previous.count != current.count,
              builder: (context, state) {
                return ElevatedButton(
                    style: buttonStyle,
                    onPressed: () => context
                        .read<QueensBloc>()
                        .add(const QueensEvent.onSolvePressed()),
                    child: Text(
                      'Display solution ${state.count + 1}',
                      style: const TextStyle(color: Colors.white),
                    ));
              },
            ),
            const Spacer(),
          ],
        ));
  }

  List<DraggableGridItem> buildListOfQueens(QueensState state) {
    return List.generate(
      numberOfQueens * numberOfQueens,
      (index) {
        final row = index ~/ numberOfQueens;
        final col = index % numberOfQueens;
        final QueenModel queen = QueenModel(row: row, col: col);
        bool selected =
            queensHandler.containsPosition(state.selectedSolution, queen);
        return DraggableGridItem(
          isDraggable: true,
          dragCallback: (BuildContext context, bool isDragging) {
            logger.d('isDragging: $isDragging');
          },
          child: QueenCellWidget(
            queen: queen,
            selected: selected,
            isSolved: state.isSolved &&
                queensHandler.containsPosition(
                  state.selectedSolution,
                  queen,
                ),
            onTap: () => context.read<QueensBloc>().add(
                  QueensEvent.onCellSelected(
                    queen: queen,
                  ),
                ),
          ),
        );
      },
    );
  }

  void onDragAccept(
      List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    context.read<QueensBloc>().add(QueensEvent.onDragApplied(
          previous: QueenModel(
            row: beforeIndex ~/ numberOfQueens,
            col: beforeIndex % numberOfQueens,
          ),
          current: QueenModel(
            row: afterIndex ~/ numberOfQueens,
            col: afterIndex % numberOfQueens,
          ),
        ));
  }

  showGameResult(bool isSolved) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isSolved ? Colors.green : Colors.redAccent,
      content: Text(isSolved ? successMessage : failureMessage),
      duration: const Duration(seconds: 2),
    ));
  }
}
