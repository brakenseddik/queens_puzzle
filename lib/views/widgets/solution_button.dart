import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:eight_queens/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowSolutionButton extends StatelessWidget {
  const ShowSolutionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueensBloc, QueensState>(
      buildWhen: (previous, current) =>
          previous.solutionCounter != current.solutionCounter,
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () => context
                .read<QueensBloc>()
                .add(const QueensEvent.onSolvePressed()),
            child: Text(
              'Display solution ${state.solutionCounter + 1}',
              style: const TextStyle(color: Colors.white),
            ));
      },
    );
  }
}
