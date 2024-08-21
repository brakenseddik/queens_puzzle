import 'package:eight_queens/queens_bloc/queens_bloc.dart';
import 'package:eight_queens/views/puzzle_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

var logger =
    Logger(printer: PrettyPrinter(dateTimeFormat: DateTimeFormat.onlyTime));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '8 Queens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<QueensBloc>(
        child: const PuzzlePage(),
        create: (BuildContext context) => QueensBloc(),
      ),
    );
  }
}
