import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            context.read<QueensBloc>().add(const QueensEvent.onStartPressed()),
        child: const Text(
          'Random Start',
          style: TextStyle(color: Colors.white),
        ));
  }
}
