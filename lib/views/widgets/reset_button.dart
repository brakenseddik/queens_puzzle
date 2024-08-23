import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            context.read<QueensBloc>().add(const QueensEvent.onResetPressed()),
        child: const Text(
          'Reset',
          style: TextStyle(color: Colors.white),
        ));
  }
}
