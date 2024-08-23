import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:eight_queens/utils/constants.dart';
import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/utils/helper_functions.dart';
import 'package:eight_queens/utils/queens_handler.dart';
import 'package:eight_queens/views/widgets/drag_widget.dart';
import 'package:eight_queens/views/widgets/reset_button.dart';
import 'package:eight_queens/views/widgets/solution_button.dart';
import 'package:eight_queens/views/widgets/start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({super.key, required this.queensHandler});

  final QueensHandler queensHandler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '👑 Eight Queens Puzzle 👑',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              BlocConsumer<QueensBloc, QueensState>(
                listener: (context, state) {
                  if (state.selectedSolution.length == 8) {
                    HelperFunctions.showGameResult(context, state.isSolved);
                  }
                  if (state.isPlacementValid == false) {
                    HelperFunctions.showFeedbackMessage(
                      context,
                      state.invalidFeedback!,
                    );
                  }
                },
                builder: (context, state) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 600,
                      maxWidth: 600,
                    ),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(4),
                        width: constraints.maxWidth,
                        height: constraints.maxWidth,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: numberOfQueens * numberOfQueens,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 8,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            final QueenModel queen = QueenModel(
                              row: index ~/ numberOfQueens,
                              col: index % numberOfQueens,
                            );
                            bool selected = state.selectedSolution.any(
                                (element) =>
                                    element.row == queen.row &&
                                    element.col == queen.col);
                            bool isDraggable =
                                state.randomQueen?.row != queen.row &&
                                    state.randomQueen?.col != queen.col;
                            bool isSolved = state.isSolved && selected;

                            return DragTarget<QueenModel>(
                              onAcceptWithDetails: (receivedQueen) => context
                                  .read<QueensBloc>()
                                  .add(QueensEvent.onDragApplied(
                                      previous: receivedQueen.data,
                                      current: queen)),
                              builder:
                                  (context, acceptedQueens, rejectedQueens) {
                                return DragWidget(
                                  queen: queen,
                                  selected: selected,
                                  isSolved: isSolved,
                                  isDraggable: isDraggable,
                                );
                              },
                            );
                          },
                        ),
                      );
                    }),
                  );
                },
              ),
              const SizedBox(
                height: 32,
              ),
              const StartButton(),
              const SizedBox(
                height: 16,
              ),
              const ShowSolutionButton(),
              const SizedBox(
                height: 16,
              ),
              const ResetButton(),
            ],
          ),
        ));
  }
}
