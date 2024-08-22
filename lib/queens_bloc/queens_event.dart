part of 'queens_bloc.dart';

@freezed
class QueensEvent with _$QueensEvent {
  const factory QueensEvent.onCellSelected({
    required QueenModel queen,
  }) = OnCellSelected;

  const factory QueensEvent.onDragApplied({
    required QueenModel previous,
    required QueenModel current,
  }) = OnDragApplied;

  const factory QueensEvent.onStartPressed() = OnStartPressed;
  const factory QueensEvent.onSolvePressed() = OnSolvePressed;
}
