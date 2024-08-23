import 'package:eight_queens/models/placement_feedback.dart';
import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:eight_queens/utils/constants.dart';
import 'package:flutter/material.dart';

class HelperFunctions {
  static String feedbackMessage(PlacementFeedback feedback) {
    String pos1 = '(${feedback.queen1.row + 1},${feedback.queen1.col + 1})';
    String pos2 = '(${feedback.queen2.row + 1},${feedback.queen2.col + 1})';
    return 'Invalid placement: Queens at positions $pos1 and $pos2 can threaten each other';
  }

  static showGameResult(BuildContext context, bool isSolved) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isSolved ? Colors.green : Colors.redAccent,
      content: Text(isSolved ? successMessage : failureMessage),
      duration: const Duration(seconds: 2),
    ));
  }

  static void showFeedbackMessage(
      BuildContext context, PlacementFeedback feedback) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orangeAccent,
      content: Text(HelperFunctions.feedbackMessage(
        feedback,
      )),
      duration: const Duration(seconds: 3),
    ));
  }
}
