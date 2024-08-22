// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queens_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QueensEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueenModel queen) onCellSelected,
    required TResult Function(QueenModel previous, QueenModel current)
        onDragApplied,
    required TResult Function() onStartPressed,
    required TResult Function() onSolvePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueenModel queen)? onCellSelected,
    TResult? Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult? Function()? onStartPressed,
    TResult? Function()? onSolvePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueenModel queen)? onCellSelected,
    TResult Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult Function()? onStartPressed,
    TResult Function()? onSolvePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnCellSelected value) onCellSelected,
    required TResult Function(OnDragApplied value) onDragApplied,
    required TResult Function(OnStartPressed value) onStartPressed,
    required TResult Function(OnSolvePressed value) onSolvePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnCellSelected value)? onCellSelected,
    TResult? Function(OnDragApplied value)? onDragApplied,
    TResult? Function(OnStartPressed value)? onStartPressed,
    TResult? Function(OnSolvePressed value)? onSolvePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnCellSelected value)? onCellSelected,
    TResult Function(OnDragApplied value)? onDragApplied,
    TResult Function(OnStartPressed value)? onStartPressed,
    TResult Function(OnSolvePressed value)? onSolvePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueensEventCopyWith<$Res> {
  factory $QueensEventCopyWith(
          QueensEvent value, $Res Function(QueensEvent) then) =
      _$QueensEventCopyWithImpl<$Res, QueensEvent>;
}

/// @nodoc
class _$QueensEventCopyWithImpl<$Res, $Val extends QueensEvent>
    implements $QueensEventCopyWith<$Res> {
  _$QueensEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnCellSelectedImplCopyWith<$Res> {
  factory _$$OnCellSelectedImplCopyWith(_$OnCellSelectedImpl value,
          $Res Function(_$OnCellSelectedImpl) then) =
      __$$OnCellSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QueenModel queen});
}

/// @nodoc
class __$$OnCellSelectedImplCopyWithImpl<$Res>
    extends _$QueensEventCopyWithImpl<$Res, _$OnCellSelectedImpl>
    implements _$$OnCellSelectedImplCopyWith<$Res> {
  __$$OnCellSelectedImplCopyWithImpl(
      _$OnCellSelectedImpl _value, $Res Function(_$OnCellSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queen = null,
  }) {
    return _then(_$OnCellSelectedImpl(
      queen: null == queen
          ? _value.queen
          : queen // ignore: cast_nullable_to_non_nullable
              as QueenModel,
    ));
  }
}

/// @nodoc

class _$OnCellSelectedImpl implements OnCellSelected {
  const _$OnCellSelectedImpl({required this.queen});

  @override
  final QueenModel queen;

  @override
  String toString() {
    return 'QueensEvent.onCellSelected(queen: $queen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnCellSelectedImpl &&
            (identical(other.queen, queen) || other.queen == queen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, queen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnCellSelectedImplCopyWith<_$OnCellSelectedImpl> get copyWith =>
      __$$OnCellSelectedImplCopyWithImpl<_$OnCellSelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueenModel queen) onCellSelected,
    required TResult Function(QueenModel previous, QueenModel current)
        onDragApplied,
    required TResult Function() onStartPressed,
    required TResult Function() onSolvePressed,
  }) {
    return onCellSelected(queen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueenModel queen)? onCellSelected,
    TResult? Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult? Function()? onStartPressed,
    TResult? Function()? onSolvePressed,
  }) {
    return onCellSelected?.call(queen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueenModel queen)? onCellSelected,
    TResult Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult Function()? onStartPressed,
    TResult Function()? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onCellSelected != null) {
      return onCellSelected(queen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnCellSelected value) onCellSelected,
    required TResult Function(OnDragApplied value) onDragApplied,
    required TResult Function(OnStartPressed value) onStartPressed,
    required TResult Function(OnSolvePressed value) onSolvePressed,
  }) {
    return onCellSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnCellSelected value)? onCellSelected,
    TResult? Function(OnDragApplied value)? onDragApplied,
    TResult? Function(OnStartPressed value)? onStartPressed,
    TResult? Function(OnSolvePressed value)? onSolvePressed,
  }) {
    return onCellSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnCellSelected value)? onCellSelected,
    TResult Function(OnDragApplied value)? onDragApplied,
    TResult Function(OnStartPressed value)? onStartPressed,
    TResult Function(OnSolvePressed value)? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onCellSelected != null) {
      return onCellSelected(this);
    }
    return orElse();
  }
}

abstract class OnCellSelected implements QueensEvent {
  const factory OnCellSelected({required final QueenModel queen}) =
      _$OnCellSelectedImpl;

  QueenModel get queen;
  @JsonKey(ignore: true)
  _$$OnCellSelectedImplCopyWith<_$OnCellSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnDragAppliedImplCopyWith<$Res> {
  factory _$$OnDragAppliedImplCopyWith(
          _$OnDragAppliedImpl value, $Res Function(_$OnDragAppliedImpl) then) =
      __$$OnDragAppliedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QueenModel previous, QueenModel current});
}

/// @nodoc
class __$$OnDragAppliedImplCopyWithImpl<$Res>
    extends _$QueensEventCopyWithImpl<$Res, _$OnDragAppliedImpl>
    implements _$$OnDragAppliedImplCopyWith<$Res> {
  __$$OnDragAppliedImplCopyWithImpl(
      _$OnDragAppliedImpl _value, $Res Function(_$OnDragAppliedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previous = null,
    Object? current = null,
  }) {
    return _then(_$OnDragAppliedImpl(
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as QueenModel,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as QueenModel,
    ));
  }
}

/// @nodoc

class _$OnDragAppliedImpl implements OnDragApplied {
  const _$OnDragAppliedImpl({required this.previous, required this.current});

  @override
  final QueenModel previous;
  @override
  final QueenModel current;

  @override
  String toString() {
    return 'QueensEvent.onDragApplied(previous: $previous, current: $current)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDragAppliedImpl &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.current, current) || other.current == current));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previous, current);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDragAppliedImplCopyWith<_$OnDragAppliedImpl> get copyWith =>
      __$$OnDragAppliedImplCopyWithImpl<_$OnDragAppliedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueenModel queen) onCellSelected,
    required TResult Function(QueenModel previous, QueenModel current)
        onDragApplied,
    required TResult Function() onStartPressed,
    required TResult Function() onSolvePressed,
  }) {
    return onDragApplied(previous, current);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueenModel queen)? onCellSelected,
    TResult? Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult? Function()? onStartPressed,
    TResult? Function()? onSolvePressed,
  }) {
    return onDragApplied?.call(previous, current);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueenModel queen)? onCellSelected,
    TResult Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult Function()? onStartPressed,
    TResult Function()? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onDragApplied != null) {
      return onDragApplied(previous, current);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnCellSelected value) onCellSelected,
    required TResult Function(OnDragApplied value) onDragApplied,
    required TResult Function(OnStartPressed value) onStartPressed,
    required TResult Function(OnSolvePressed value) onSolvePressed,
  }) {
    return onDragApplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnCellSelected value)? onCellSelected,
    TResult? Function(OnDragApplied value)? onDragApplied,
    TResult? Function(OnStartPressed value)? onStartPressed,
    TResult? Function(OnSolvePressed value)? onSolvePressed,
  }) {
    return onDragApplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnCellSelected value)? onCellSelected,
    TResult Function(OnDragApplied value)? onDragApplied,
    TResult Function(OnStartPressed value)? onStartPressed,
    TResult Function(OnSolvePressed value)? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onDragApplied != null) {
      return onDragApplied(this);
    }
    return orElse();
  }
}

abstract class OnDragApplied implements QueensEvent {
  const factory OnDragApplied(
      {required final QueenModel previous,
      required final QueenModel current}) = _$OnDragAppliedImpl;

  QueenModel get previous;
  QueenModel get current;
  @JsonKey(ignore: true)
  _$$OnDragAppliedImplCopyWith<_$OnDragAppliedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnStartPressedImplCopyWith<$Res> {
  factory _$$OnStartPressedImplCopyWith(_$OnStartPressedImpl value,
          $Res Function(_$OnStartPressedImpl) then) =
      __$$OnStartPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnStartPressedImplCopyWithImpl<$Res>
    extends _$QueensEventCopyWithImpl<$Res, _$OnStartPressedImpl>
    implements _$$OnStartPressedImplCopyWith<$Res> {
  __$$OnStartPressedImplCopyWithImpl(
      _$OnStartPressedImpl _value, $Res Function(_$OnStartPressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnStartPressedImpl implements OnStartPressed {
  const _$OnStartPressedImpl();

  @override
  String toString() {
    return 'QueensEvent.onStartPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnStartPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueenModel queen) onCellSelected,
    required TResult Function(QueenModel previous, QueenModel current)
        onDragApplied,
    required TResult Function() onStartPressed,
    required TResult Function() onSolvePressed,
  }) {
    return onStartPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueenModel queen)? onCellSelected,
    TResult? Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult? Function()? onStartPressed,
    TResult? Function()? onSolvePressed,
  }) {
    return onStartPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueenModel queen)? onCellSelected,
    TResult Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult Function()? onStartPressed,
    TResult Function()? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onStartPressed != null) {
      return onStartPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnCellSelected value) onCellSelected,
    required TResult Function(OnDragApplied value) onDragApplied,
    required TResult Function(OnStartPressed value) onStartPressed,
    required TResult Function(OnSolvePressed value) onSolvePressed,
  }) {
    return onStartPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnCellSelected value)? onCellSelected,
    TResult? Function(OnDragApplied value)? onDragApplied,
    TResult? Function(OnStartPressed value)? onStartPressed,
    TResult? Function(OnSolvePressed value)? onSolvePressed,
  }) {
    return onStartPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnCellSelected value)? onCellSelected,
    TResult Function(OnDragApplied value)? onDragApplied,
    TResult Function(OnStartPressed value)? onStartPressed,
    TResult Function(OnSolvePressed value)? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onStartPressed != null) {
      return onStartPressed(this);
    }
    return orElse();
  }
}

abstract class OnStartPressed implements QueensEvent {
  const factory OnStartPressed() = _$OnStartPressedImpl;
}

/// @nodoc
abstract class _$$OnSolvePressedImplCopyWith<$Res> {
  factory _$$OnSolvePressedImplCopyWith(_$OnSolvePressedImpl value,
          $Res Function(_$OnSolvePressedImpl) then) =
      __$$OnSolvePressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSolvePressedImplCopyWithImpl<$Res>
    extends _$QueensEventCopyWithImpl<$Res, _$OnSolvePressedImpl>
    implements _$$OnSolvePressedImplCopyWith<$Res> {
  __$$OnSolvePressedImplCopyWithImpl(
      _$OnSolvePressedImpl _value, $Res Function(_$OnSolvePressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnSolvePressedImpl implements OnSolvePressed {
  const _$OnSolvePressedImpl();

  @override
  String toString() {
    return 'QueensEvent.onSolvePressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSolvePressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QueenModel queen) onCellSelected,
    required TResult Function(QueenModel previous, QueenModel current)
        onDragApplied,
    required TResult Function() onStartPressed,
    required TResult Function() onSolvePressed,
  }) {
    return onSolvePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QueenModel queen)? onCellSelected,
    TResult? Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult? Function()? onStartPressed,
    TResult? Function()? onSolvePressed,
  }) {
    return onSolvePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QueenModel queen)? onCellSelected,
    TResult Function(QueenModel previous, QueenModel current)? onDragApplied,
    TResult Function()? onStartPressed,
    TResult Function()? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onSolvePressed != null) {
      return onSolvePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnCellSelected value) onCellSelected,
    required TResult Function(OnDragApplied value) onDragApplied,
    required TResult Function(OnStartPressed value) onStartPressed,
    required TResult Function(OnSolvePressed value) onSolvePressed,
  }) {
    return onSolvePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnCellSelected value)? onCellSelected,
    TResult? Function(OnDragApplied value)? onDragApplied,
    TResult? Function(OnStartPressed value)? onStartPressed,
    TResult? Function(OnSolvePressed value)? onSolvePressed,
  }) {
    return onSolvePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnCellSelected value)? onCellSelected,
    TResult Function(OnDragApplied value)? onDragApplied,
    TResult Function(OnStartPressed value)? onStartPressed,
    TResult Function(OnSolvePressed value)? onSolvePressed,
    required TResult orElse(),
  }) {
    if (onSolvePressed != null) {
      return onSolvePressed(this);
    }
    return orElse();
  }
}

abstract class OnSolvePressed implements QueensEvent {
  const factory OnSolvePressed() = _$OnSolvePressedImpl;
}

/// @nodoc
mixin _$QueensState {
  List<QueenModel> get selectedSolution => throw _privateConstructorUsedError;
  bool get isSolved => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  bool? get isPlacementValid => throw _privateConstructorUsedError;
  PlacementFeedback? get invalidFeedback => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueensStateCopyWith<QueensState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueensStateCopyWith<$Res> {
  factory $QueensStateCopyWith(
          QueensState value, $Res Function(QueensState) then) =
      _$QueensStateCopyWithImpl<$Res, QueensState>;
  @useResult
  $Res call(
      {List<QueenModel> selectedSolution,
      bool isSolved,
      int count,
      bool? isPlacementValid,
      PlacementFeedback? invalidFeedback});
}

/// @nodoc
class _$QueensStateCopyWithImpl<$Res, $Val extends QueensState>
    implements $QueensStateCopyWith<$Res> {
  _$QueensStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSolution = null,
    Object? isSolved = null,
    Object? count = null,
    Object? isPlacementValid = freezed,
    Object? invalidFeedback = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSolution: null == selectedSolution
          ? _value.selectedSolution
          : selectedSolution // ignore: cast_nullable_to_non_nullable
              as List<QueenModel>,
      isSolved: null == isSolved
          ? _value.isSolved
          : isSolved // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isPlacementValid: freezed == isPlacementValid
          ? _value.isPlacementValid
          : isPlacementValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidFeedback: freezed == invalidFeedback
          ? _value.invalidFeedback
          : invalidFeedback // ignore: cast_nullable_to_non_nullable
              as PlacementFeedback?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueensStateImplCopyWith<$Res>
    implements $QueensStateCopyWith<$Res> {
  factory _$$QueensStateImplCopyWith(
          _$QueensStateImpl value, $Res Function(_$QueensStateImpl) then) =
      __$$QueensStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QueenModel> selectedSolution,
      bool isSolved,
      int count,
      bool? isPlacementValid,
      PlacementFeedback? invalidFeedback});
}

/// @nodoc
class __$$QueensStateImplCopyWithImpl<$Res>
    extends _$QueensStateCopyWithImpl<$Res, _$QueensStateImpl>
    implements _$$QueensStateImplCopyWith<$Res> {
  __$$QueensStateImplCopyWithImpl(
      _$QueensStateImpl _value, $Res Function(_$QueensStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSolution = null,
    Object? isSolved = null,
    Object? count = null,
    Object? isPlacementValid = freezed,
    Object? invalidFeedback = freezed,
  }) {
    return _then(_$QueensStateImpl(
      selectedSolution: null == selectedSolution
          ? _value._selectedSolution
          : selectedSolution // ignore: cast_nullable_to_non_nullable
              as List<QueenModel>,
      isSolved: null == isSolved
          ? _value.isSolved
          : isSolved // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isPlacementValid: freezed == isPlacementValid
          ? _value.isPlacementValid
          : isPlacementValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidFeedback: freezed == invalidFeedback
          ? _value.invalidFeedback
          : invalidFeedback // ignore: cast_nullable_to_non_nullable
              as PlacementFeedback?,
    ));
  }
}

/// @nodoc

class _$QueensStateImpl implements _QueensState {
  const _$QueensStateImpl(
      {required final List<QueenModel> selectedSolution,
      required this.isSolved,
      required this.count,
      required this.isPlacementValid,
      required this.invalidFeedback})
      : _selectedSolution = selectedSolution;

  final List<QueenModel> _selectedSolution;
  @override
  List<QueenModel> get selectedSolution {
    if (_selectedSolution is EqualUnmodifiableListView)
      return _selectedSolution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSolution);
  }

  @override
  final bool isSolved;
  @override
  final int count;
  @override
  final bool? isPlacementValid;
  @override
  final PlacementFeedback? invalidFeedback;

  @override
  String toString() {
    return 'QueensState(selectedSolution: $selectedSolution, isSolved: $isSolved, count: $count, isPlacementValid: $isPlacementValid, invalidFeedback: $invalidFeedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueensStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedSolution, _selectedSolution) &&
            (identical(other.isSolved, isSolved) ||
                other.isSolved == isSolved) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.isPlacementValid, isPlacementValid) ||
                other.isPlacementValid == isPlacementValid) &&
            (identical(other.invalidFeedback, invalidFeedback) ||
                other.invalidFeedback == invalidFeedback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedSolution),
      isSolved,
      count,
      isPlacementValid,
      invalidFeedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueensStateImplCopyWith<_$QueensStateImpl> get copyWith =>
      __$$QueensStateImplCopyWithImpl<_$QueensStateImpl>(this, _$identity);
}

abstract class _QueensState implements QueensState {
  const factory _QueensState(
      {required final List<QueenModel> selectedSolution,
      required final bool isSolved,
      required final int count,
      required final bool? isPlacementValid,
      required final PlacementFeedback? invalidFeedback}) = _$QueensStateImpl;

  @override
  List<QueenModel> get selectedSolution;
  @override
  bool get isSolved;
  @override
  int get count;
  @override
  bool? get isPlacementValid;
  @override
  PlacementFeedback? get invalidFeedback;
  @override
  @JsonKey(ignore: true)
  _$$QueensStateImplCopyWith<_$QueensStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
