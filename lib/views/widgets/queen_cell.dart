import 'package:eight_queens/models/queen_model.dart';
import 'package:eight_queens/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QueenCellWidget extends StatelessWidget {
  const QueenCellWidget({
    super.key,
    required this.queen,
    required this.selected,
    required this.onTap,
    required this.isSolved,
  });

  final QueenModel queen;
  final bool selected;
  final bool isSolved;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        width: MediaQuery.of(context).size.width / numberOfQueens,
        height: MediaQuery.of(context).size.width / numberOfQueens,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(
            color: Colors.deepPurple,
            width: 1,
          ),
        ),
        child: selected
            ? SvgPicture.asset(
                'assets/crown.svg',
                width: 40,
                colorFilter: ColorFilter.mode(
                  queen.row % 2 == queen.col % 2
                      ? Colors.white
                      : Colors.deepPurple,
                  BlendMode.srcIn,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Color get boxColor {
    return isSolved
        ? Colors.green
        : (queen.row % 2 == queen.col % 2)
            ? Colors.deepPurple
            : Colors.deepPurple.shade100;
  }
}
