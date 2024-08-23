import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:eight_queens/views/widgets/queen_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DragWidget extends StatelessWidget {
  const DragWidget({
    super.key,
    required this.queen,
    required this.selected,
    required this.isSolved,
    required this.isDraggable,
  });

  final QueenModel queen;
  final bool selected;
  final bool isSolved;
  final bool isDraggable;

  @override
  Widget build(BuildContext context) {
    return isDraggable
        ? Draggable<QueenModel>(
            data: queen,
            feedback: QueenCellWidget(
              queen: queen,
              selected: selected,
              isSolved: isSolved,
              onTap: () {},
            ),
            childWhenDragging: Container(),
            child: QueenCellWidget(
              queen: queen,
              selected: selected,
              isSolved: isSolved,
              onTap: () => context
                  .read<QueensBloc>()
                  .add(QueensEvent.onCellSelected(queen: queen)),
            ),
          )
        : QueenCellWidget(
            queen: queen,
            selected: selected,
            isSolved: isSolved,
            onTap: () {},
          );
  }
}
