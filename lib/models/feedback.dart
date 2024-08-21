import 'package:eight_queens/models/queen_model.dart';

enum PlacementFeedbackType {
  SAME_ROW,
  SAME_COLUMN,
  SAME_DIAGONAL,
  VALID,
}

class PlacementFeedback {
  final PlacementFeedbackType type;
  final QueenModel queen1;
  final QueenModel queen2;

  PlacementFeedback({
    required this.type,
    required this.queen1,
    required this.queen2,
  });
}
