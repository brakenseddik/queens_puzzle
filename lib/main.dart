import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:eight_queens/utils/app_theme.dart';
import 'package:eight_queens/utils/queens_handler.dart';
import 'package:eight_queens/views/puzzle_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.onlyTime),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '8 Queens',
      theme: AppThemes.lightTheme,
      home: BlocProvider<QueensBloc>(
        child: PuzzlePage(queensHandler: QueensHandler()),
        create: (BuildContext context) => QueensBloc(),
      ),
    );
  }
}
