import 'package:flutter/material.dart';

class QueenCellWidget extends StatelessWidget {
  const QueenCellWidget({
    super.key,
    required this.row,
    required this.col,
    required this.selected,
    required this.onTap,
    required this.isSolved,
  });

  final int row;
  final int col;
  final bool selected;
  final bool isSolved;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 8,
        height: MediaQuery.of(context).size.width / 8,
        decoration: BoxDecoration(
          color: isSolved
              ? Colors.green
              : (row % 2 == col % 2)
                  ? Colors.deepPurple
                  : Colors.deepPurple.shade200,
        ),
        child: selected
            ? Image.asset('assets/crown.png', color: Colors.white)
            : const SizedBox.shrink(),
      ),
    );
  }
}
